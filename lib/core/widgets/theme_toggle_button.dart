import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatelessWidget {
  final double? size;
  final Color? iconColor;

  const ThemeToggleButton({super.key, this.size, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          onPressed: () => themeProvider.toggleTheme(),
          icon: Icon(
            themeProvider.isDarkMode
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            size: size ?? 24.r,
            color: iconColor ?? context.colors.text,
          ),
          tooltip: themeProvider.isDarkMode
              ? 'Switch to Light Mode'
              : 'Switch to Dark Mode',
        );
      },
    );
  }
}

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.light_mode_outlined,
              color: !themeProvider.isDarkMode
                  ? context.colors.accent
                  : context.colors.textSecondary,
            ),
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (_) => themeProvider.toggleTheme(),
              activeThumbColor: context.colors.accent,
            ),
            Icon(
              Icons.dark_mode_outlined,
              color: themeProvider.isDarkMode
                  ? context.colors.accent
                  : context.colors.textSecondary,
            ),
          ],
        );
      },
    );
  }
}
