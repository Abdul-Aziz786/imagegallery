import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkPhoto extends StatelessWidget {
  const NetworkPhoto({required this.url, this.memCacheWidth, super.key});

  final String url;
  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      memCacheWidth: memCacheWidth,
      fadeInDuration: const Duration(milliseconds: 180),
      placeholder: (context, url) => const ColoredBox(
        color: Color(0x14000000),
        child: Center(
          child: SizedBox.square(
            dimension: 22,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const ColoredBox(
        color: Color(0x14000000),
        child: Icon(Icons.broken_image_outlined),
      ),
    );
  }
}

class GalleryImageTile extends StatelessWidget {
  const GalleryImageTile({
    required this.imageUrl,
    required this.heroTag,
    required this.onTap,
    super.key,
  });

  final String imageUrl;
  final String heroTag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Hero(
          tag: heroTag,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth.isFinite
                  ? constraints.maxWidth
                  : 240.0;
              final cacheWidth =
                  (width * MediaQuery.devicePixelRatioOf(context)).round();
              return NetworkPhoto(url: imageUrl, memCacheWidth: cacheWidth);
            },
          ),
        ),
      ),
    );
  }
}
