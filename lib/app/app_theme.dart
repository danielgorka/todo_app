import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static const _mainColor = Color(0xFF127AC9);

  static ThemeData light = _theme(isDark: false);

  static ThemeData dark = _theme(isDark: true);

  static ThemeData _theme({required bool isDark}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _mainColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
    return ThemeData(
      colorScheme: colorScheme,
      brightness: isDark ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.standard,
      appBarTheme: _appBarTheme(colorScheme, isDark),
    );
  }

  static AppBarTheme _appBarTheme(
    ColorScheme scheme,
    bool isDark,
  ) {
    final style =
        isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    return AppBarTheme(
      centerTitle: true,
      elevation: 3,
      // Theme for status bar and system navigation bar
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: style.statusBarBrightness,
        statusBarIconBrightness: style.statusBarIconBrightness,
        systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
        systemNavigationBarColor: scheme.surfaceContainerLow,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
