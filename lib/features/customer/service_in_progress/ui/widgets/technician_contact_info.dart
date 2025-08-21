import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianContactInfo extends StatelessWidget {
  final ServiceProgressModel serviceProgress;
  final VoidCallback? onCallPressed;
  final VoidCallback? onChatPressed;

  const TechnicianContactInfo({
    super.key,
    required this.serviceProgress,
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
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceSecondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                serviceProgress.technicianPhoto,
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Technician Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceProgress.technicianName,
                  style: context.textStyles.cardTitle,
                ),
                SizedBox(height: 2.h),
                Text(
                  serviceProgress.technicianTier,
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
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: context.colors.textOnAccent,
                    size: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              // Call Button
              GestureDetector(
                onTap: onCallPressed,
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: context.colors.accent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: context.colors.textOnAccent,
                    size: 16.sp,
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
