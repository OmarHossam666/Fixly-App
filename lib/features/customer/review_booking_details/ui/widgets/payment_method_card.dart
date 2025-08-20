import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/review_booking_details/models/booking_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends StatelessWidget {
  final BookingDetailsModel bookingDetails;
  final VoidCallback? onChangePaymentMethod;

  const PaymentMethodCard({
    super.key,
    required this.bookingDetails,
    this.onChangePaymentMethod,
  });

  IconData _getPaymentIcon(String paymentMethod) {
    if (paymentMethod.toLowerCase().contains('visa')) {
      return Icons.credit_card;
    } else if (paymentMethod.toLowerCase().contains('mastercard')) {
      return Icons.credit_card;
    } else if (paymentMethod.toLowerCase().contains('cash')) {
      return Icons.payments;
    }
    return Icons.payment;
  }

  Color _getPaymentIconColor(String paymentMethod, BuildContext context) {
    if (paymentMethod.toLowerCase().contains('visa')) {
      return const Color(0xFF1A1F71); // Visa blue
    } else if (paymentMethod.toLowerCase().contains('mastercard')) {
      return const Color(0xFFEB001B); // Mastercard red
    }
    return context.colors.primary;
  }

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

          Row(
            children: [
              // Payment Icon
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  _getPaymentIcon(bookingDetails.paymentMethod),
                  color: _getPaymentIconColor(
                    bookingDetails.paymentMethod,
                    context,
                  ),
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),

              // Payment Method Text
              Expanded(
                child: Text(
                  bookingDetails.paymentMethod,
                  style: context.textStyles.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Change Button
              if (onChangePaymentMethod != null)
                GestureDetector(
                  onTap: onChangePaymentMethod,
                  child: Text(
                    'Change',
                    style: context.textStyles.bodyText.copyWith(
                      color: context.colors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
