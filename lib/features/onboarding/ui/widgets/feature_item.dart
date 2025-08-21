import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final BuildContext context;
  final Color color;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.text,
    required this.context,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        horizontalSpacing(8),
        Expanded(
          child: Text(
            text,
            style: context.textStyles.bodyTextSmall.copyWith(
              color: color,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
