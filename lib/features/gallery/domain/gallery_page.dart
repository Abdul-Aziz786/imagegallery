import 'package:imagegallery/features/gallery/domain/gallery_image.dart';

class GalleryPage {
  const GalleryPage({required this.totalHits, required this.images});

  final int totalHits;
  final List<GalleryImage> images;

  factory GalleryPage.fromPixabay(Map<String, dynamic> json) {
    final hits = json['hits'] as List<dynamic>? ?? const [];
    return GalleryPage(
      totalHits: json['totalHits'] as int? ?? 0,
      images: [
        for (final hit in hits)
          GalleryImage.fromJson(Map<String, dynamic>.from(hit as Map)),
      ],
    );
  }
}
