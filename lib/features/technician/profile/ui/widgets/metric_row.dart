import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetricRow extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final Icon? suffixIcon;
  const MetricRow({
    super.key,
    required this.title,
    required this.value,
    required this.valueColor,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textStyles.bodyTextBold.copyWith(color: valueColor),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Text(
              value,
              style: context.textStyles.bodyTextBold.copyWith(
                color: valueColor,
              ),
            ),
            suffixIcon != null
                ? Icon(suffixIcon!.icon, size: 16.sp, color: suffixIcon!.color)
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
