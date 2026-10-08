import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imagegallery/core/route/app_router.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/photo_tile.dart';

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({required this.images, super.key});

  final List<GalleryImage> images;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columnCount(constraints.maxWidth),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return GalleryImageTile(
              imageUrl: image.webformatURL,
              heroTag: _heroTag(image.id),
              onTap: () => context.router.push(
                ImageDetailRoute(image: image, heroTag: _heroTag(image.id)),
              ),
            );
          },
        );
      },
    );
  }
}

String _heroTag(int id) => 'favorites-image-$id';

int _columnCount(double width) {
  if (width >= 1000) return 4;
  if (width >= 700) return 3;
  return 2;
}
