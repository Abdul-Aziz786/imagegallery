// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(galleryPageLoader)
final galleryPageLoaderProvider = GalleryPageLoaderProvider._();

final class GalleryPageLoaderProvider
    extends
        $FunctionalProvider<
          GalleryPageLoader,
          GalleryPageLoader,
          GalleryPageLoader
        >
    with $Provider<GalleryPageLoader> {
  GalleryPageLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'galleryPageLoaderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$galleryPageLoaderHash();

  @$internal
  @override
  $ProviderElement<GalleryPageLoader> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GalleryPageLoader create(Ref ref) {
    return galleryPageLoader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GalleryPageLoader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GalleryPageLoader>(value),
    );
  }
}

String _$galleryPageLoaderHash() => r'a1b2c3d4e5f60718293a4b5c6d7e8f9012345678';
