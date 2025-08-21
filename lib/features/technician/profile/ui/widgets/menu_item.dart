import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color iconColor;
  const MenuItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceDark(
      borderColorAll: true,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      allRadius: 12.r,
      borderRadiusAll: true,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 13),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],

      child: Row(
        children: [
          Icon(iconData, color: iconColor, size: 20.sp),
          horizontalSpacing(12),
          Expanded(
            child: Text(
              title,
              style: context.textStyles.bodyText.copyWith(fontSize: 20.sp),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
        ],
      ),
    );
  }
}
