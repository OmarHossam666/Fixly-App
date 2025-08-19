import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fixly Logo Container
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
        SizedBox(height: 24.h),

        // Fixly Brand Text
        Text(
          'Fixly',
          style: context.textStyles.headline.copyWith(
            fontSize: 36.sp,
            letterSpacing: -1,
          ),
        ),

        SizedBox(height: 8.h),

        // Arabic Text
        Text(
          'صلّحلي',
          style: context.textStyles.headline.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: context.colors.accent,
          ),
        ),
      ],
    );
  }
}
