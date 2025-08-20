import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

enum SocialLoginType { google, facebook }

class SocialLoginButton extends StatelessWidget {
  final SocialLoginType type;
  final VoidCallback onPressed;
  final bool isLoading;

  const SocialLoginButton({
    super.key,
    required this.type,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final config = _getButtonConfig(context);

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: config.backgroundColor,
          foregroundColor: config.textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBackgroundColor: config.backgroundColor.withValues(
            alpha: 0.6,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            config.icon,
            const SizedBox(width: 12),
            Text(
              config.text,
              style: context.textStyles.primaryButton.copyWith(
                color: config.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _ButtonConfig _getButtonConfig(BuildContext context) {
    switch (type) {
      case SocialLoginType.google:
        return _ButtonConfig(
          backgroundColor: context.colors.google,
          textColor: Colors.white,
          text: 'Continue with Google',
          icon: const Icon(Icons.email, color: Colors.white, size: 20),
        );
      case SocialLoginType.facebook:
        return _ButtonConfig(
          backgroundColor: context.colors.facebook,
          textColor: Colors.white,
          text: 'Continue with Facebook',
          icon: const Text(
            'f',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
    }
  }
}

class _ButtonConfig {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Widget icon;

  const _ButtonConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.icon,
  });
}
