import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gal/gal.dart';
import 'package:imagegallery/core/network/dio.dart';
import 'package:imagegallery/core/error/image_error.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_image.g.dart';

@Riverpod(keepAlive: true)
ImageSaver imageSaver(Ref ref) {
  return ImageSaver(ref.watch(dioProvider));
}

class ImageSaver {
  ImageSaver(this._dio);

  final Dio _dio;

  Future<void> save(
    GalleryImage image, {
    required void Function(double? progress) onProgress,
  }) async {
    final granted = await Gal.hasAccess() || await Gal.requestAccess();
    if (!granted) {
      throw ImageException('Photo library access is required to save images.');
    }

    try {
      final response = await _dio.get<List<int>>(
        image.largeImageURL,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: (received, total) {
          onProgress(total <= 0 ? null : received / total);
        },
      );
      final data = response.data;
      if (data == null || data.isEmpty) {
        throw ImageException('The image file was empty.');
      }
      final bytes = data is Uint8List ? data : Uint8List.fromList(data);
      await Gal.putImageBytes(bytes, name: 'pixabay_${image.id}');
    } on GalException catch (error) {
      throw ImageException(error.type.message);
    } on DioException catch (error) {
      throw ImageException(error.message ?? 'Could not download the image.');
    }
  }
}
