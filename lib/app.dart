import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagegallery/core/route/app_router.dart';
import 'package:imagegallery/core/theme/theme.dart';

class ImageGalleryApp extends ConsumerWidget {
  const ImageGalleryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeControllerProvider);

    return MaterialApp.router(
      title: 'Image Gallery',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router.config(),
    );
  }
}
