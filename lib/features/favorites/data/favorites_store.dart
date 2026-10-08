import 'dart:convert';

import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_store.g.dart';

const favoritesStorageKey = 'favorite_images';

@Riverpod(keepAlive: true)
Future<FavoritesStore> favoritesStore(Ref ref) async {
  final prefs = await SharedPreferences.getInstance();
  return FavoritesStore(prefs);
}

class FavoritesStore {
  FavoritesStore(this._prefs);

  final SharedPreferences _prefs;

  Future<List<GalleryImage>> load() async {
    final raw = _prefs.getString(favoritesStorageKey);
    if (raw == null || raw.isEmpty) return const [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return [
      for (final item in decoded)
        GalleryImage.fromJson(item as Map<String, dynamic>),
    ];
  }

  Future<void> save(List<GalleryImage> images) async {
    final encoded = jsonEncode([for (final image in images) image.toJson()]);
    await _prefs.setString(favoritesStorageKey, encoded);
  }
}

List<GalleryImage> toggleFavorite(
  List<GalleryImage> current,
  GalleryImage image,
) {
  final exists = current.any((item) => item.id == image.id);
  if (exists) {
    return [
      for (final item in current)
        if (item.id != image.id) item,
    ];
  }
  return [...current, image];
}
