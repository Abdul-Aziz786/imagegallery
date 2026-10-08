import 'package:imagegallery/features/favorites/data/favorites_store.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  @override
  Future<List<GalleryImage>> build() async {
    final store = await ref.watch(favoritesStoreProvider.future);
    return store.load();
  }

  Future<void> toggle(GalleryImage image) async {
    final current = state.value ?? const <GalleryImage>[];
    final next = toggleFavorite(current, image);
    state = AsyncData(next);
    final store = await ref.read(favoritesStoreProvider.future);
    await store.save(next);
  }
}
