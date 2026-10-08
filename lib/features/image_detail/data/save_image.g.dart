// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_image.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageSaver)
final imageSaverProvider = ImageSaverProvider._();

final class ImageSaverProvider
    extends $FunctionalProvider<ImageSaver, ImageSaver, ImageSaver>
    with $Provider<ImageSaver> {
  ImageSaverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageSaverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageSaverHash();

  @$internal
  @override
  $ProviderElement<ImageSaver> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImageSaver create(Ref ref) {
    return imageSaver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageSaver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageSaver>(value),
    );
  }
}

String _$imageSaverHash() => r'dbdca1efb435c88a79d05e1175d5e03cb01acf83';
