import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UrgentWidget extends StatelessWidget {
  const UrgentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      alignment: Alignment.center,
      height: 30.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: context.colors.lightRed,
        borderRadius: BorderRadius.circular(15.r),
      ),

      child: Text(
        AppStrings.urgentUppercase,
        style: context.textStyles.bold14Text.copyWith(
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
