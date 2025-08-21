import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final bool showIcon;

  const PrimaryButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading || onPressed == null ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primaryButton,
          foregroundColor: context.colors.primaryButtonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBackgroundColor: context.colors.primaryButton.withValues(alpha: 0.6),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.colors.primaryButtonText,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showIcon && icon != null) ...[
                    Icon(
                      icon,
                      size: 20,
                      color: context.colors.primaryButtonText,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Text(
                    text,
                    style: context.textStyles.primaryButton,
                  ),
                ],
              ),
      ),
    );
  }
}