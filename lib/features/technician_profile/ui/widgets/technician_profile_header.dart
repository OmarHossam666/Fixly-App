import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianProfileHeader extends StatelessWidget {
  final TechnicianModel technician;

  const TechnicianProfileHeader({super.key, required this.technician});

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
        children: [
          // Profile Photo
          Container(
            width: 96.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceSecondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(technician.photo, style: TextStyle(fontSize: 48.sp)),
            ),
          ),
          SizedBox(height: 16.h),

          // Name and Title
          Text(
            technician.name,
            style: context.textStyles.headline.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            technician.tier,
            style: context.textStyles.bodyText.copyWith(
              fontSize: 18.sp,
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),

          // Flash Badge
          if (technician.isFlashAvailable)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colors.accent.withValues(alpha: 0.50),
                    context.colors.accent.withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('⚡', style: TextStyle(fontSize: 14.sp)),
                  SizedBox(width: 4.w),
                  Text(
                    'Fixly Flash Available',
                    style: context.textStyles.caption.copyWith(
                      color: context.colors.textOnAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
