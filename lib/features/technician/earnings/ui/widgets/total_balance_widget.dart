import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: context.textStyles.bodyTextBold.copyWith(
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
          verticalSpacing(17),
          Text(
            "\$1,250.00",
            style: context.textStyles.bodyTextBold.copyWith(
              fontSize: 31.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
