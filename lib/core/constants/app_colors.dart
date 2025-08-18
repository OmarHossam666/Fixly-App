import 'package:flutter/material.dart';

/// Fixly App Color Palette
/// Provides comprehensive color scheme for both light and dark themes
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Light Theme Colors
  static const _lightColors = _LightColors();

  // Dark Theme Colors
  static const _darkColors = _DarkColors();

  /// Get colors based on current theme brightness
  static ColorScheme colors(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? _darkColors : _lightColors;
  }

  /// Get light theme colors explicitly
  static ColorScheme get lightColors => _lightColors;

  /// Get dark theme colors explicitly
  static ColorScheme get darkColors => _darkColors;

  /// Check if current theme is dark
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

/// Abstract base class for color schemes
abstract class ColorScheme {
  // Brand Colors
  Color get primary;
  Color get accent;

  // Background & Surface Colors
  Color get background;
  Color get surface;
  Color get surfaceSecondary;
  Color get surfaceElevated;

  // Text Colors
  Color get text;
  Color get textSecondary;
  Color get textTertiary;
  Color get textOnAccent;

  // Interactive Elements
  Color get border;
  Color get borderLight;

  // Button Colors
  Color get primaryButton;
  Color get primaryButtonText;
  Color get secondaryButton;
  Color get secondaryButtonText;

  // Status Colors
  Color get success;
  Color get warning;
  Color get error;

  Color get notificationBadge;
  // Social Login Colors
  Color get google;
  Color get facebook;
}

/// Light theme color implementation
class _LightColors implements ColorScheme {
  const _LightColors();

  // Brand Colors
  @override
  Color get primary => const Color(0xFF1B365D); // Navy Blue

  @override
  Color get accent => const Color(0xFFFF6B35); // Bright Orange

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFFFFFFFF); // White

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceSecondary => const Color(0xFFF8F9FA); // Light Gray

  @override
  Color get surfaceElevated => const Color(0xFFFFFFFF);

  // Text Colors
  @override
  Color get text => const Color(0xFF1B365D); // Navy blue

  @override
  Color get textSecondary => const Color(0xFF6B7280); // Muted gray

  @override
  Color get textTertiary => const Color(0x801B365D); // Faded navy (50% opacity)

  @override
  Color get textOnAccent => const Color(0xFFFFFFFF); // White

  // Interactive Elements
  @override
  Color get border => const Color(0xFFE5E7EB);

  @override
  Color get borderLight => const Color(0xFFF3F4F6);

  // Button Colors
  @override
  Color get primaryButton => const Color(0xFFFF6B35); // Bright Orange

  @override
  Color get primaryButtonText => const Color(0xFFFFFFFF);

  @override
  Color get secondaryButton => const Color(0xFFF3F4F6);

  @override
  Color get secondaryButtonText => const Color(0xFF1B365D);

  // Status Colors
  @override
  Color get success => const Color(0xFF10B981);

  @override
  Color get warning => const Color(0xFFF59E0B);

  @override
  Color get error => const Color(0xFFEF4444);

  @override
  Color get notificationBadge => const Color(0xFFF44336);

  // Social Login Colors
  @override
  Color get google => const Color(0xFF4285F4);

  @override
  Color get facebook => const Color(0xFF1877F2);
}

/// Dark theme color implementation
class _DarkColors implements ColorScheme {
  const _DarkColors();

  // Brand Colors
  @override
  Color get primary => const Color(0xFF2563EB); // Lighter blue

  @override
  Color get accent => const Color(0xFFFB923C); // Muted orange

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFF0F172A); // Dark navy

  @override
  Color get surface => const Color(0xFF1E293B);

  @override
  Color get surfaceSecondary => const Color(0xFF334155);

  @override
  Color get surfaceElevated => const Color(0xFF475569);

  // Text Colors
  @override
  Color get text => const Color(0xFFF1F5F9);

  @override
  Color get textSecondary => const Color(0xFFCBD5E1);

  @override
  Color get textTertiary => const Color(0x99F1F5F9); // 60% opacity

  @override
  Color get textOnAccent => const Color(0xFFFFFFFF);

  // Interactive Elements
  @override
  Color get border => const Color(0xFF475569);

  @override
  Color get borderLight => const Color(0xFF64748B);

  // Button Colors
  @override
  Color get primaryButton => const Color(0xFFFB923C); // Muted orange

  @override
  Color get primaryButtonText => const Color(0xFFFFFFFF);

  @override
  Color get secondaryButton => const Color(0xFF475569);

  @override
  Color get secondaryButtonText => const Color(0xFFF1F5F9);

  // Status Colors
  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFBBF24);

  @override
  Color get error => const Color(0xFFF87171);

  @override
  Color get notificationBadge => const Color(0xFFF44336);
  // Social Login Colors
  @override
  Color get google => const Color(0xFF4285F4);

  @override
  Color get facebook => const Color(0xFF1877F2);
}

/// Extension methods for easy color access
extension AppColorsExtension on BuildContext {
  /// Quick access to app colors based on current theme
  ColorScheme get colors => AppColors.colors(this);

  /// Check if current theme is dark
  bool get isDarkMode => AppColors.isDark(this);
}

/// Utility class for creating gradients and color variations
class AppColorUtils {
  AppColorUtils._();

  /// Create a gradient from primary to accent color
  static LinearGradient primaryGradient(BuildContext context) {
    final colors = AppColors.colors(context);
    return LinearGradient(
      colors: [colors.primary, colors.accent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  /// Create a subtle surface gradient
  static LinearGradient surfaceGradient(BuildContext context) {
    final colors = AppColors.colors(context);
    return LinearGradient(
      colors: [colors.surface, colors.surfaceSecondary],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  /// Get color with custom opacity
  static Color withAlpha(Color color, int alpha) {
    return color.withAlpha(alpha);
  }

  /// Lighten a color by a percentage
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Darken a color by a percentage
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
