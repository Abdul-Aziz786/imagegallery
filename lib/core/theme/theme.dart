import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => ThemeMode.system;

  void toggle({required bool platformDark}) {
    final isDark =
        state == ThemeMode.dark || (state == ThemeMode.system && platformDark);
    state = isDark ? ThemeMode.light : ThemeMode.dark;
  }
}

abstract final class AppTheme {
  static const _seed = Color(0xFF0F766E);

  static ThemeData light() => _base(ColorScheme.fromSeed(seedColor: _seed));

  static ThemeData dark() => _base(
    ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark),
  );

  static ThemeData _base(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: scheme.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: scheme.onPrimary),
        actionsIconTheme: IconThemeData(color: scheme.onPrimary),
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) =>
            const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
