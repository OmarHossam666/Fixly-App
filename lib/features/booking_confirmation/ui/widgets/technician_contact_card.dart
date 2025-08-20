import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/booking_confirmation/models/booking_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianContactCard extends StatelessWidget {
  final BookingConfirmationModel booking;
  final VoidCallback? onCallPressed;
  final VoidCallback? onChatPressed;

  const TechnicianContactCard({
    super.key,
    required this.booking,
    this.onCallPressed,
    this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Row(
        children: [
          // Technician Photo
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceSecondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                booking.technicianPhoto,
                style: TextStyle(fontSize: 28.sp),
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // Technician Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.technicianName,
                  style: context.textStyles.cardTitle,
                ),
                SizedBox(height: 4.h),
                Text(
                  booking.technicianTier,
                  style: context.textStyles.caption.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Contact Buttons
          Row(
            children: [
              // Chat Button
              GestureDetector(
                onTap: onChatPressed,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: context.colors.textOnAccent,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              // Call Button
              GestureDetector(
                onTap: onCallPressed,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: context.colors.accent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: context.colors.textOnAccent,
                    size: 18.sp,
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
