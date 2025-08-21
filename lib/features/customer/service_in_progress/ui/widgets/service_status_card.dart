import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/service_in_progress/data/service_progress_data.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceStatusCard extends StatelessWidget {
  final ServiceProgressModel serviceProgress;

  const ServiceStatusCard({super.key, required this.serviceProgress});

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'location_on':
        return Icons.location_on;
      case 'search':
        return Icons.search;
      case 'build':
        return Icons.build;
      case 'check_circle':
        return Icons.check_circle;
      default:
        return Icons.help;
    }
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
          Text('Service Status', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          ...serviceProgress.serviceSteps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isActive = step.id == serviceProgress.currentStatus;
            final isCompleted =
                serviceProgress.currentStatus.index > step.id.index;
            final isLast = index == serviceProgress.serviceSteps.length - 1;

            return Column(
              children: [
                Row(
                  children: [
                    // Status Icon
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? context.colors.success
                            : isActive
                            ? context.colors.accent
                            : context.colors.surfaceSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getIconData(step.icon),
                        color: isCompleted || isActive
                            ? Colors.white
                            : context.colors.textTertiary,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),

                    // Status Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step.label,
                            style: context.textStyles.bodyTextBold.copyWith(
                              color: isActive
                                  ? context.colors.accent
                                  : isCompleted
                                  ? context.colors.success
                                  : context.colors.textTertiary,
                            ),
                          ),
                          if (isActive && step.description != null) ...[
                            SizedBox(height: 4.h),
                            Text(
                              ServiceProgressData.getStatusDescription(
                                serviceProgress.currentStatus,
                                serviceProgress.technicianName,
                              ),
                              style: context.textStyles.bodyTextSmall.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    // Completion Check
                    if (isCompleted)
                      Icon(
                        Icons.check,
                        color: context.colors.success,
                        size: 20.sp,
                      ),
                  ],
                ),

                // Connector Line
                if (!isLast) ...[
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    width: 2.w,
                    height: 20.h,
                    color: isCompleted
                        ? context.colors.success
                        : context.colors.borderLight,
                  ),
                  SizedBox(height: 16.h),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}
