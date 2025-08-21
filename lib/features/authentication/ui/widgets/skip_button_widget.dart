import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        'Skip for now',
        style: context.textStyles.primaryButton.copyWith(
          color: context.colors.textTertiary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
