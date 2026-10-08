// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesStore)
final favoritesStoreProvider = FavoritesStoreProvider._();

final class FavoritesStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<FavoritesStore>,
          FavoritesStore,
          FutureOr<FavoritesStore>
        >
    with $FutureModifier<FavoritesStore>, $FutureProvider<FavoritesStore> {
  FavoritesStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesStoreHash();

  @$internal
  @override
  $FutureProviderElement<FavoritesStore> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FavoritesStore> create(Ref ref) {
    return favoritesStore(ref);
  }
}

String _$favoritesStoreHash() => r'd0d2ffff3c99aa4c374d1b0655386567c6f1ce56';
