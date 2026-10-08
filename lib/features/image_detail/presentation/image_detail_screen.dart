import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/image_detail/presentation/widgets/detail_actions.dart';
import 'package:imagegallery/features/image_detail/presentation/widgets/detail_info.dart';
import 'package:imagegallery/features/image_detail/presentation/widgets/detail_photo.dart';

@RoutePage()
class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({
    required this.image,
    required this.heroTag,
    super.key,
  });

  final GalleryImage image;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.user),
        actions: [
          FavoriteButton(image: image),
          ShareImageButton(image: image),
          DownloadImageButton(image: image),
        ],
      ),
      body: ListView(
        children: [
          DetailPhoto(image: image, heroTag: heroTag),
          DetailInfo(image: image),
        ],
      ),
    );
  }
}
