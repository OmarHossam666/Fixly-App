import 'package:flutter/material.dart';
import 'app_colors.dart' hide ColorScheme;

// backgound keyword is deprecated in color scheme, used surface instead
// the custom widget surface is not related the to backgournd(surface)
class AppTheme {
  static final light = lightTheme;
  static final dark = darkTheme;
}




final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightColors.background,
    foregroundColor: AppColors.lightColors.text,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.lightColors.primary,
    secondary: AppColors.lightColors.accent,
    surface: AppColors.lightColors.background,
    error: AppColors.lightColors.error,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkColors.background,
    foregroundColor: AppColors.darkColors.text,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.darkColors.primary,
    secondary: AppColors.darkColors.accent,
    surface: AppColors.darkColors.background,
    error: AppColors.darkColors.error,
  ),
);
