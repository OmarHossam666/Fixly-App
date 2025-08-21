import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptHeaderWidget extends StatelessWidget {
  const ReceiptHeaderWidget({super.key});

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
          // App logo
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primary,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Main Settings Icon
                Icon(
                  Icons.settings,
                  size: 50.sp,
                  color: context.colors.background,
                ),
                // Speed/Location Icon Overlay
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.accent,
                    ),
                    child: Icon(
                      Icons.flash_on,
                      size: 16.sp,
                      color: context.colors.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // App name
          Text(
            'Fixly',
            style: context.textStyles.screenTitle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),

          // Receipt subtitle
          Text(
            'Official Service Receipt',
            style: context.textStyles.bodyText.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
