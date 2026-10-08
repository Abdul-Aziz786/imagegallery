import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imagegallery/core/route/app_router.dart';
import 'package:imagegallery/core/theme/theme_toggle_button.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/gallery_search_field.dart';

@RoutePage()
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        actions: [
          const ThemeToggleButton(),
          IconButton(
            tooltip: 'Favorites',
            onPressed: () => context.router.push(const FavoritesRoute()),
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
        bottom: const GallerySearchField(),
      ),
      body: const GalleryGrid(),
    );
  }
}
