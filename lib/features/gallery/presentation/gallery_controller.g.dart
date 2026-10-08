// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GalleryController)
final galleryControllerProvider = GalleryControllerProvider._();

final class GalleryControllerProvider
    extends $NotifierProvider<GalleryController, String> {
  GalleryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'galleryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$galleryControllerHash();

  @$internal
  @override
  GalleryController create() => GalleryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$galleryControllerHash() => r'a572e94aa4fa94ac5f0119d1d31f5dc9de260da7';

abstract class _$GalleryController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
