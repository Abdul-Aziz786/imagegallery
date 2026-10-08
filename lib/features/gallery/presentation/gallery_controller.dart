import 'package:imagegallery/features/gallery/data/pixabay_api.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_controller.g.dart';

@Riverpod(keepAlive: true)
class GalleryController extends _$GalleryController {
  late final PagingController<int, GalleryImage> pagingController;
  int? _totalItems;

  @override
  String build() {
    pagingController = PagingController<int, GalleryImage>(
      getNextPageKey: (pagingState) {
        final lastPage = pagingState.pages?.lastOrNull;
        final nextPage = (pagingState.keys?.lastOrNull ?? 0) + 1;
        if (lastPage == null) return nextPage;
        if (lastPage.length < pageSize) return null;
        final total = _totalItems;
        if (total != null && (pagingState.items?.length ?? 0) >= total) {
          return null;
        }
        return nextPage;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(pagingController.dispose);
    return '';
  }

  Future<List<GalleryImage>> _fetchPage(int pageKey) async {
    final page = await ref.read(galleryPageLoaderProvider)(
      query: state,
      page: pageKey,
    );
    _totalItems = page.totalHits;
    return page.images;
  }

  void updateQuery(String query) {
    final trimmed = query.trim();
    if (trimmed == state) return;
    state = trimmed;
    refreshGallery();
  }

  Future<void> refreshGallery() async {
    _totalItems = null;
    pagingController.refresh();
  }
}
