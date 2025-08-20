import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking_confirmation/models/booking_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingConfirmationHeader extends StatelessWidget {
  final BookingConfirmationModel booking;

  const BookingConfirmationHeader({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: context.colors.text.withValues(alpha: 0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // Success Icon
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: context.colors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: context.colors.success,
              size: 32.sp,
            ),
          ),
          SizedBox(height: 16.h),

          // Success Message
          Text(
            'Your booking has been successfully confirmed!',
            style: context.textStyles.screenTitle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          // Technician Status
          Text(
            '${booking.technicianName} is on the way to you now',
            style: context.textStyles.bodyText.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),

          // Booking ID
          Text(
            'Booking ID: ${booking.bookingId}',
            style: context.textStyles.caption.copyWith(
              color: context.colors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
