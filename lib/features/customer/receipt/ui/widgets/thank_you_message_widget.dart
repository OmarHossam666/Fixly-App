import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/receipt/data/receipt_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouMessageWidget extends StatelessWidget {
  const ThankYouMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: context.colors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.success.withValues(alpha: 0.3),
          width: 2.w,
        ),
      ),
      child: Column(
        children: [
          // Success icon
          Icon(Icons.favorite, color: context.colors.success, size: 32.r),
          SizedBox(height: 12.h),

          // Thank you title
          Text(
            'Thank you for using Fixly!',
            style: context.textStyles.cardTitle.copyWith(
              color: context.colors.success,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          // Thank you message
          Text(
            ReceiptData.getThankYouMessage(),
            style: context.textStyles.bodyTextSmall.copyWith(
              color: context.colors.success.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
