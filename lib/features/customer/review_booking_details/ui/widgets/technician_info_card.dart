import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianInfoCard extends StatelessWidget {
  final TechnicianModel technician;

  const TechnicianInfoCard({super.key, required this.technician});

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
          // Profile Photo
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceSecondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(technician.photo, style: TextStyle(fontSize: 20.sp)),
            ),
          ),
          SizedBox(width: 12.w),

          // Technician Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(technician.name, style: context.textStyles.cardTitle),
                SizedBox(height: 2.h),
                Text(
                  technician.tier,
                  style: context.textStyles.caption.copyWith(
                    color: context.colors.textSecondary,
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
