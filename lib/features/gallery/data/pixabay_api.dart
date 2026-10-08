import 'package:dio/dio.dart';
import 'package:imagegallery/core/network/dio.dart';
import 'package:imagegallery/core/confiq/env.dart';
import 'package:imagegallery/core/error/image_error.dart';
import 'package:imagegallery/features/gallery/domain/gallery_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pixabay_api.g.dart';

const pageSize = 20;

typedef GalleryPageLoader = Future<GalleryPage> Function({
  required String query,
  required int page,
});

@Riverpod(keepAlive: true)
GalleryPageLoader galleryPageLoader(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ({required String query, required int page}) {
    return fetchPixabayPage(dio, query: query, page: page);
  };
}

Future<GalleryPage> fetchPixabayPage(
  Dio dio, {
  required String query,
  required int page,
}) async {
  try {
    final response = await dio.get<Map<String, dynamic>>(
      '',
      queryParameters: {
        'key': Env.apiKey,
        'q': query,
        'page': page,
        'per_page': pageSize,
        'image_type': 'photo',
      },
    );
    final data = response.data;
    if (data == null) {
      throw ImageException('Could not load images');
    }
    return GalleryPage.fromPixabay(data);
  } on DioException catch (error) {
    throw ImageException(dioErrorMessage(error));
  }
}

String dioErrorMessage(DioException error) {
  final data = error.response?.data;
  if (data is Map && data['error'] is String) {
    return data['error'] as String;
  }
  if (data is String && data.isNotEmpty) return data;
  return error.message ?? 'Could not load images';
}
