import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import your app_colors.dart file

/// Provides theme-aware text styles for the application.
///
/// Access styles via the `AppStyles.of(context)` method or the `context.textStyles` extension,
/// which automatically returns the correct style set (light or dark) based on the current theme.
class AppStyles {
  // Private constructor to prevent instantiation.
  AppStyles._();

  /// The primary font family used throughout the app.
  static const String _fontFamily = 'Quicksand';

  /// Holds the set of text styles for the light theme.
  static final AppTextStyles light = _LightTextStyles();

  /// Holds the set of text styles for the dark theme.
  static final AppTextStyles dark = _DarkTextStyles();

  /// Retrieves the appropriate set of text styles based on the provided [BuildContext].
  static AppTextStyles of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? dark : light;
  }
}

/// Abstract base class defining the set of text styles for the app.
/// This ensures that both light and dark theme implementations have the same styles available.
abstract class AppTextStyles {
  // --- HEADINGS & TITLES ---
  TextStyle get headline;
  TextStyle get screenTitle;
  TextStyle get sectionHeader;
  TextStyle get cardTitle;

  // --- BODY & PARAGRAPH TEXT ---
  TextStyle get bodyText;
  TextStyle get bodyTextBold;
  TextStyle get bodyTextSmall;
  TextStyle get caption;

  // --- BUTTONS ---
  TextStyle get primaryButton;

  // --- SPECIALIZED STYLES ---
  TextStyle get logoSubtitle;
  TextStyle get errorTitle;
  TextStyle get errorSubtitle;
}

/// Implements the [AppTextStyles] for the **light** theme.
class _LightTextStyles implements AppTextStyles {
  // Using a private static instance of light colors for efficiency.
  static final _colors = AppColors.lightColors;

  @override
  TextStyle get headline => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get screenTitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _colors.text,
      );

  @override
  TextStyle get sectionHeader => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get cardTitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get bodyText => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: _colors.text,
      );

  @override
  TextStyle get bodyTextBold => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _colors.text,
      );

  @override
  TextStyle get bodyTextSmall => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: _colors.textSecondary,
        height: 1.28,
      );

  @override
  TextStyle get caption => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: _colors.textSecondary,
        height: 1.33,
      );

  @override
  TextStyle get primaryButton => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colors.primaryButtonText,
      );

  @override
  TextStyle get logoSubtitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: _colors.accent,
      );

  @override
  TextStyle get errorTitle => const TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Color(0xFF111111), // Specific color for light mode error
      );

  @override
  TextStyle get errorSubtitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        color: _colors.textSecondary,
        fontSize: 16,
        height: 1.5,
      );
}

/// Implements the [AppTextStyles] for the **dark** theme.
class _DarkTextStyles implements AppTextStyles {
  // Using a private static instance of dark colors for efficiency.
  static final _colors = AppColors.darkColors;

  @override
  TextStyle get headline => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get screenTitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _colors.text,
      );

  @override
  TextStyle get sectionHeader => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get cardTitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  @override
  TextStyle get bodyText => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: _colors.text,
      );

  @override
  TextStyle get bodyTextBold => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _colors.text,
      );

  @override
  TextStyle get bodyTextSmall => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: _colors.textSecondary,
        height: 1.28,
      );

  @override
  TextStyle get caption => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: _colors.textSecondary,
        height: 1.33,
      );

  @override
  TextStyle get primaryButton => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colors.primaryButtonText,
      );

  @override
  TextStyle get logoSubtitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: _colors.accent,
      );

  @override
  TextStyle get errorTitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: _colors.text,
      );

  @override
  TextStyle get errorSubtitle => TextStyle(
        fontFamily: AppStyles._fontFamily,
        color: _colors.textSecondary,
        fontSize: 16,
        height: 1.5,
      );
}

/// Extension method on [BuildContext] for easy access to the theme-aware text styles.
///
/// Example: `Text('Hello', style: context.textStyles.headline)`
extension AppStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppStyles.of(this);
}