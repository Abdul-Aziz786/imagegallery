import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagegallery/features/gallery/presentation/gallery_controller.dart';

class GallerySearchField extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const GallerySearchField({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  ConsumerState<GallerySearchField> createState() => _GallerySearchFieldState();
}

class _GallerySearchFieldState extends ConsumerState<GallerySearchField> {
  static const _searchDebounce = Duration(milliseconds: 500);

  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(_searchDebounce, () {
      ref.read(galleryControllerProvider.notifier).updateQuery(value);
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _debounce?.cancel();
    ref.read(galleryControllerProvider.notifier).updateQuery('');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: ListenableBuilder(
        listenable: _searchController,
        builder: (context, _) {
          return TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: _searchController,
            textInputAction: TextInputAction.search,
            style: TextStyle(color: scheme.onSurface),
            cursorColor: scheme.primary,
            decoration: InputDecoration(
              hintText: 'Search photos',
              hintStyle: TextStyle(color: scheme.onSurfaceVariant),
              filled: true,
              fillColor: scheme.surface,
              prefixIcon: Icon(Icons.search_rounded, color: scheme.primary),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: _clearSearch,
                      icon: Icon(
                        Icons.close_rounded,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: scheme.primaryContainer,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: _onSearchChanged,
            onSubmitted: (value) {
              _debounce?.cancel();
              ref.read(galleryControllerProvider.notifier).updateQuery(value);
            },
          );
        },
      ),
    );
  }
}
