import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagegallery/features/favorites/presentation/favorites_controller.dart';
import 'package:imagegallery/features/favorites/presentation/widgets/favorites_grid.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/status_view.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: const FavoritesBody(),
    );
  }
}

class FavoritesBody extends ConsumerWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesControllerProvider);

    return favorites.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => GalleryStatusView(
        icon: Icons.error_outline,
        message: 'Could not load favorites',
        onRetry: () => ref.invalidate(favoritesControllerProvider),
      ),
      data: (images) {
        if (images.isEmpty) {
          return const GalleryStatusView(
            icon: Icons.favorite_border,
            message: 'No favorites yet',
          );
        }
        return FavoritesGrid(images: images);
      },
    );
  }
}
