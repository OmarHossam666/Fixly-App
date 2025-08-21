import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod selectedPaymentMethod;
  final String paymentMethodDetails;
  final Function(PaymentMethod) onPaymentMethodChanged;

  const PaymentMethodCard({
    super.key,
    required this.selectedPaymentMethod,
    required this.paymentMethodDetails,
    required this.onPaymentMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Method', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Payment method options
          Column(
            children: PaymentMethod.values.map((method) {
              return _buildPaymentMethodOption(context, method);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption(BuildContext context, PaymentMethod method) {
    final isSelected = selectedPaymentMethod == method;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () => onPaymentMethodChanged(method),
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? context.colors.accent
                  : context.colors.borderLight,
              width: 2.w,
            ),
            color: isSelected
                ? context.colors.accent.withValues(alpha: 0.05)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              // Payment method icon
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: method == PaymentMethod.card
                      ? const Color(0xFF1877F2).withValues(alpha: 0.1)
                      : context.colors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  method == PaymentMethod.card
                      ? Icons.credit_card
                      : Icons.money,
                  color: method == PaymentMethod.card
                      ? const Color(0xFF1877F2)
                      : context.colors.success,
                  size: 24.r,
                ),
              ),
              SizedBox(width: 16.w),

              // Payment method details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method.displayName,
                      style: context.textStyles.bodyTextBold,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      method == PaymentMethod.card
                          ? paymentMethodDetails
                          : 'Pay the technician directly',
                      style: context.textStyles.bodyTextSmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Selection indicator
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: context.colors.accent,
                  size: 24.r,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
