import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AuthToggleWidget extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggle;

  const AuthToggleWidget({
    super.key,
    required this.isLogin,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onToggle,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.textStyles.bodyTextSmall,
          children: [
            TextSpan(
              text: isLogin
                  ? "Don't have an account? "
                  : 'Already have an account? ',
            ),
            TextSpan(
              text: isLogin ? 'Sign Up' : 'Log In',
              style: context.textStyles.bodyTextSmall.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
