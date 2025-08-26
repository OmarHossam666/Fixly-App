import 'package:fixly/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Extension methods for easy theme provider access
extension ThemeExtension on BuildContext {
  /// Quick access to theme provider
  ThemeProvider get themeProvider =>
      Provider.of<ThemeProvider>(this, listen: false);

  /// Quick access to theme provider with listening
  ThemeProvider get watchThemeProvider =>
      Provider.of<ThemeProvider>(this, listen: true);

  /// Toggle theme shortcut
  Future<void> toggleTheme() => themeProvider.toggleTheme();

  /// Set specific theme mode
  Future<void> setThemeMode(ThemeMode mode) => themeProvider.setThemeMode(mode);
}
