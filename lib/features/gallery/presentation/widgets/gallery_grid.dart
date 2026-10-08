import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagegallery/core/route/app_router.dart';
import 'package:imagegallery/core/error/image_error.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/gallery/presentation/gallery_controller.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/photo_tile.dart';
import 'package:imagegallery/features/gallery/presentation/widgets/status_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GalleryGrid extends ConsumerWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(galleryControllerProvider.notifier);

    return RefreshIndicator(
      onRefresh: controller.refreshGallery,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ValueListenableBuilder(
            valueListenable: controller.pagingController,
            builder: (context, state, _) {
              return PagedGridView<int, GalleryImage>(
                state: state,
                fetchNextPage: controller.pagingController.fetchNextPage,
                showNewPageProgressIndicatorAsGridChild: false,
                showNewPageErrorIndicatorAsGridChild: false,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _columnCount(constraints.maxWidth),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                    return GalleryImageTile(
                      imageUrl: item.webformatURL,
                      heroTag: _heroTag(item.id),
                      onTap: () => context.router.push(
                        ImageDetailRoute(
                          image: item,
                          heroTag: _heroTag(item.id),
                        ),
                      ),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  firstPageErrorIndicatorBuilder: (_) => GalleryStatusView(
                    icon: Icons.cloud_off_outlined,
                    message: imageErrorMessage(state.error ?? 'Error'),
                    onRetry: controller.pagingController.fetchNextPage,
                  ),
                  newPageProgressIndicatorBuilder: (_) =>
                      const GalleryFooter.loading(),
                  newPageErrorIndicatorBuilder: (_) => GalleryFooter.error(
                    message: imageErrorMessage(state.error ?? 'Error'),
                    onRetry: controller.pagingController.fetchNextPage,
                  ),
                  noItemsFoundIndicatorBuilder: (_) => const GalleryStatusView(
                    icon: Icons.image_not_supported_outlined,
                    message: 'No images found',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String _heroTag(int id) => 'gallery-image-$id';

int _columnCount(double width) {
  if (width >= 1000) return 4;
  if (width >= 700) return 3;
  return 2;
}
