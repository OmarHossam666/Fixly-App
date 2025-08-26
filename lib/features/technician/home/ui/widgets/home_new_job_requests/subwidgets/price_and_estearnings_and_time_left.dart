import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/generated/locale_keys.g.dart';

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
            LocaleKeys.metrics_and_stats_total_balance.tr(),
            style: context.textStyles.bodyTextBold.copyWith(
              color: context.colors.success,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            LocaleKeys.time_and_pricing_est_earnings.tr(),
            style: context.textStyles.bodyTextSmall.copyWith(fontSize: 10.sp),
            textAlign: TextAlign.end,
          ),
          Text(
            "45 ${LocaleKeys.time_and_pricing_seconds_left.tr()}",
            style: context.textStyles.logoSubtitle,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
