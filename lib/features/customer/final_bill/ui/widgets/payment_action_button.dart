import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentActionButton extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final VoidCallback onPressed;
  final bool isLoading;

  const PaymentActionButton({
    super.key,
    required this.paymentMethod,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonText = paymentMethod == PaymentMethod.card
        ? 'Pay Now'
        : 'Confirm Cash Payment';

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          disabledBackgroundColor: context.colors.textTertiary,
        ),
        child: isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (paymentMethod == PaymentMethod.card) ...[
                    Icon(Icons.credit_card, size: 20.r),
                    SizedBox(width: 8.w),
                  ] else ...[
                    Icon(Icons.money, size: 20.r),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    buttonText,
                    style: context.textStyles.bodyTextBold.copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
