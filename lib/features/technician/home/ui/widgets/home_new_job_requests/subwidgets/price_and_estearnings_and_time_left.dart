import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndEstearningsAndTimeLeft extends StatelessWidget {
  const PriceAndEstearningsAndTimeLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$50",
            style: context.textStyles.bodyTextBold.copyWith(
              color: context.colors.success,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            "Est.earnings",
            style: context.textStyles.bodyTextSmall.copyWith(fontSize: 10.sp),
            textAlign: TextAlign.end,
          ),
          Text(
            "\$45s left",
            style: context.textStyles.logoSubtitle,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
