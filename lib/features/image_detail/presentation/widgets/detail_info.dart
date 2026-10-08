import 'package:flutter/material.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({required this.image, super.key});

  final GalleryImage image;

  @override
  Widget build(BuildContext context) {
    final description = image.tags
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .join(', ');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(description.isEmpty ? 'No description provided.' : description),
          const SizedBox(height: 16),
          Text('By ${image.user}'),
          const SizedBox(height: 4),
          Text(
            '${image.likes} likes · ${image.imageWidth}×${image.imageHeight}',
          ),
        ],
      ),
    );
  }
}
