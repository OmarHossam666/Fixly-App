import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/widgets/custom_elevated_button.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewProfileBookNowRow extends StatelessWidget {
  const ViewProfileBookNowRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              // View Profile button
              Expanded(
                flex: 2,
                child: CustomElevatedButton(
                  color: const Color(0xFF374151),
                  text: 'View Profile',
                  height: 48.h,
                  radius: 12.r,
                  textStyle: context.textStyles.bold14Text.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              SizedBox(width: 6.w),

              // Call button
              SurfaceDark(
                width: 40.w,
                height: 40.w,
                surfaceColor: context.colors.success,
                borderRadiusAll: true,
                allRadius: 12.r,
                child: Icon(
                  Icons.phone,
                  color: context.colors.textOnAccent,
                  size: 20.sp,
                ),
              ),

              SizedBox(width: 6.w),

              // Message button
              SurfaceDark(
                width: 40.w,
                height: 40.w,
                surfaceColor: context.colors.facebook,
                borderRadiusAll: true,
                allRadius: 12.r,
                child: Icon(
                  Icons.message,
                  color: context.colors.textOnAccent,
                  size: 20.sp,
                ),
              ),

              SizedBox(width: 6.w),

              // Book Now button
              Expanded(
                flex: 2,
                child: CustomElevatedButton(
                  color: context.colors.accent,
                  text: 'Book Now',
                  height: 48.h,
                  radius: 12.r,
                  textStyle: context.textStyles.bold14Text.copyWith(
                    color: context.colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          );
  }
}