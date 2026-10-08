// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

final class FavoritesControllerProvider
    extends $AsyncNotifierProvider<FavoritesController, List<GalleryImage>> {
  FavoritesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();
}

String _$favoritesControllerHash() =>
    r'e9cd0e3acd09967780b232cdffa4e2d291eaecec';

abstract class _$FavoritesController
    extends $AsyncNotifier<List<GalleryImage>> {
  FutureOr<List<GalleryImage>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<GalleryImage>>, List<GalleryImage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GalleryImage>>, List<GalleryImage>>,
              AsyncValue<List<GalleryImage>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
