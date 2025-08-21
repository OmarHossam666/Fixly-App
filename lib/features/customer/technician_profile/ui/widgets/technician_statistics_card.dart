import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianStatisticsCard extends StatelessWidget {
  final TechnicianModel technician;

  const TechnicianStatisticsCard({super.key, required this.technician});

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
          Text('Key Statistics', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatisticItem(
                value: technician.rating.toString(),
                label: '⭐ Rating',
                context: context,
              ),
              _StatisticItem(
                value: '${technician.jobCount}+',
                label: 'Jobs Completed',
                context: context,
              ),
              _StatisticItem(
                value: technician.yearsExperience.toString(),
                label: 'Years Experience',
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  final String value;
  final String label;
  final BuildContext context;

  const _StatisticItem({
    required this.value,
    required this.label,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textStyles.headline.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: context.colors.accent,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: context.textStyles.caption.copyWith(
            color: context.colors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
