import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  TextStyle get onlineButton;
  TextStyle get statisticsWidgetText;
  TextStyle get green16Bold;

  // --- SPECIALIZED STYLES ---
  TextStyle get logoSubtitle;
  TextStyle get errorTitle;
  TextStyle get errorSubtitle;

  TextStyle get bold14Text;
}

/// Implements the [AppTextStyles] for the **light** theme.
class _LightTextStyles implements AppTextStyles {
  // Using a private static instance of light colors for efficiency.
  static final _colors = AppColors.lightColors;

  @override
  TextStyle get headline => TextStyle(
    fontFamily: AppStyles._fontFamily,

    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: _colors.text,
  );


  @override
  TextStyle get statisticsWidgetText => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: _colors.text,
  );

  @override
  TextStyle get bold14Text => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: _colors.textOnAccent,
  );


  @override
  TextStyle get screenTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: _colors.text,
  );


  @override
  TextStyle get green16Bold => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _colors.success,
  );


  @override
  TextStyle get sectionHeader => TextStyle(
    fontFamily: AppStyles._fontFamily,
    customer-phase-1
    fontSize: 18.sp,
  );

  @override
  TextStyle get cardTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: _colors.text,
  );

  @override
  TextStyle get bodyText => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: _colors.text,
  );

  @override
  TextStyle get bodyTextBold => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: _colors.text,
  );

  @override
  TextStyle get bodyTextSmall => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: _colors.textSecondary,
    height: 1.28,
  );

  @override
  TextStyle get caption => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: _colors.textSecondary,
    height: 1.33,
  );

  @override
  TextStyle get primaryButton => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: _colors.primaryButtonText,
  );
  
  @override
  TextStyle get onlineButton => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: _colors.primaryButtonText,
  );

  @override
  TextStyle get logoSubtitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: _colors.accent,
  );

  @override
   TextStyle get errorTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF111111), // Specific color for light mode error
  );

  @override
  TextStyle get errorSubtitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    color: _colors.textSecondary,
    fontSize: 16.sp,
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
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: _colors.text,
  );

  @override
  TextStyle get statisticsWidgetText => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: _colors.text,
  );

  @override
  TextStyle get bold14Text => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: _colors.textOnAccent,
  );

  @override
  TextStyle get screenTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: _colors.text,
  );

  @override
  TextStyle get green16Bold => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _colors.success,
  );


  @override
  TextStyle get sectionHeader => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: _colors.text,
  );

  @override
  TextStyle get cardTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: _colors.text,
  );

  @override
  TextStyle get bodyText => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: _colors.text,
  );

  @override
  TextStyle get bodyTextBold => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: _colors.text,
  );

  @override
  TextStyle get bodyTextSmall => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: _colors.textSecondary,
    height: 1.28,
  );

  @override
  TextStyle get caption => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: _colors.textSecondary,
    height: 1.33,
  );

  @override
  TextStyle get primaryButton => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: _colors.primaryButtonText,
  );

  @override
  TextStyle get onlineButton => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: _colors.primaryButtonText,
  );

  @override
  TextStyle get logoSubtitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: _colors.accent,
  );

  @override
  TextStyle get errorTitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: _colors.text,
  );

  @override
  TextStyle get errorSubtitle => TextStyle(
    fontFamily: AppStyles._fontFamily,
    color: _colors.textSecondary,
    fontSize: 16.sp,
    height: 1.5,
  );
}

/// Extension method on [BuildContext] for easy access to the theme-aware text styles.
///
/// Example: `Text('Hello', style: context.textStyles.headline)`
extension AppStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppStyles.of(this);
}
