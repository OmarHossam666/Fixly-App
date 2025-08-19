import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final bool isLogin;

  const WelcomeTextWidget({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isLogin ? 'Welcome Back!' : 'Get Started',
          style: context.textStyles.headline,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          isLogin
              ? 'Sign in to access your account'
              : 'Fast repairs at your location',
          style: context.textStyles.bodyTextSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
