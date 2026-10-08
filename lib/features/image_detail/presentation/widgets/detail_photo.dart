import 'package:flutter/material.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/photo_tile.dart';

class DetailPhoto extends StatelessWidget {
  const DetailPhoto({required this.image, required this.heroTag, super.key});

  final GalleryImage image;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: AspectRatio(
        aspectRatio: image.imageWidth / image.imageHeight,
        child: NetworkPhoto(url: image.largeImageURL),
      ),
    );
  }
}
