import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagegallery/core/error/image_error.dart';
import 'package:imagegallery/features/favorites/presentation/favorites_controller.dart';
import 'package:imagegallery/features/gallery/domain/gallery_image.dart';
import 'package:imagegallery/features/image_detail/data/save_image.dart';
import 'package:share_plus/share_plus.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({required this.image, super.key});

  final GalleryImage image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesControllerProvider);
    final isFavorite =
        favorites.value?.any((item) => item.id == image.id) ?? false;

    return IconButton(
      tooltip: isFavorite ? 'Remove favorite' : 'Save favorite',
      onPressed: () =>
          ref.read(favoritesControllerProvider.notifier).toggle(image),
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}

class ShareImageButton extends StatelessWidget {
  const ShareImageButton({required this.image, super.key});

  final GalleryImage image;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Share',
      onPressed: () {
        SharePlus.instance.share(ShareParams(uri: Uri.parse(image.pageURL)));
      },
      icon: const Icon(Icons.share_outlined),
    );
  }
}

class DownloadImageButton extends ConsumerStatefulWidget {
  const DownloadImageButton({required this.image, super.key});

  final GalleryImage image;

  @override
  ConsumerState<DownloadImageButton> createState() =>
      _DownloadImageButtonState();
}

class _DownloadImageButtonState extends ConsumerState<DownloadImageButton> {
  var _downloading = false;

  Future<void> _download() async {
    if (_downloading) return;
    setState(() => _downloading = true);
    final messenger = ScaffoldMessenger.of(context);
    final progress = ValueNotifier<double?>(null);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(minutes: 2),
          content: ValueListenableBuilder<double?>(
            valueListenable: progress,
            builder: (context, value, _) {
              final percent = value == null ? null : (value * 100).round();
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    percent == null ? 'Downloading…' : 'Downloading $percent%',
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: value),
                ],
              );
            },
          ),
        ),
      );

    try {
      await ref
          .read(imageSaverProvider)
          .save(widget.image, onProgress: (value) => progress.value = value);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('Saved to your gallery')));
    } catch (error) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(imageErrorMessage(error))));
    } finally {
      Future<void>.delayed(const Duration(milliseconds: 400), progress.dispose);
      if (mounted) setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Download',
      onPressed: _downloading ? null : _download,
      icon: _downloading
          ? SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : const Icon(Icons.download_outlined),
    );
  }
}
