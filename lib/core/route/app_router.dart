import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imagegallery/features/favorites/presentation/favorites_screen.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/gallery/presentation/gallery_screen.dart';
import 'package:imagegallery/features/image_detail/presentation/image_detail_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref ref) {
  final router = AppRouter();
  ref.onDispose(router.dispose);
  return router;
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GalleryRoute.page, initial: true),
    AutoRoute(page: ImageDetailRoute.page),
    AutoRoute(page: FavoritesRoute.page),
  ];
}
