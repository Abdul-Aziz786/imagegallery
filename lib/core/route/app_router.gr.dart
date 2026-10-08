// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesScreen();
    },
  );
}

/// generated route for
/// [GalleryScreen]
class GalleryRoute extends PageRouteInfo<void> {
  const GalleryRoute({List<PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GalleryScreen();
    },
  );
}

/// generated route for
/// [ImageDetailScreen]
class ImageDetailRoute extends PageRouteInfo<ImageDetailRouteArgs> {
  ImageDetailRoute({
    required GalleryImage image,
    required String heroTag,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ImageDetailRoute.name,
         args: ImageDetailRouteArgs(image: image, heroTag: heroTag, key: key),
         initialChildren: children,
       );

  static const String name = 'ImageDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageDetailRouteArgs>();
      return ImageDetailScreen(
        image: args.image,
        heroTag: args.heroTag,
        key: args.key,
      );
    },
  );
}

class ImageDetailRouteArgs {
  const ImageDetailRouteArgs({
    required this.image,
    required this.heroTag,
    this.key,
  });

  final GalleryImage image;

  final String heroTag;

  final Key? key;

  @override
  String toString() {
    return 'ImageDetailRouteArgs{image: $image, heroTag: $heroTag, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageDetailRouteArgs) return false;
    return image == other.image && heroTag == other.heroTag && key == other.key;
  }

  @override
  int get hashCode => image.hashCode ^ heroTag.hashCode ^ key.hashCode;
}
