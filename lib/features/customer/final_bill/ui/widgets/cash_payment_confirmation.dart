import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashPaymentConfirmation extends StatelessWidget {
  final double totalAmount;
  final String technicianName;

  const CashPaymentConfirmation({
    super.key,
    required this.totalAmount,
    required this.technicianName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Yellow-50
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFF59E0B), // Yellow-500
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: const Color(0xFFD97706), // Yellow-600
            size: 24.r,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: context.textStyles.bodyTextSmall.copyWith(
                  color: const Color(0xFF92400E), // Yellow-800
                ),
                children: [
                  const TextSpan(text: 'Please confirm that you have handed '),
                  TextSpan(
                    text: '${totalAmount.toStringAsFixed(0)} EGP',
                    style: context.textStyles.bodyTextBold.copyWith(
                      color: const Color(0xFF92400E), // Yellow-800
                    ),
                  ),
                  TextSpan(text: ' to $technicianName'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
