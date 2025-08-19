import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianVerificationCard extends StatelessWidget {
  final TechnicianModel technician;

  const TechnicianVerificationCard({super.key, required this.technician});

  String _getBadgeIcon(String badge) {
    switch (badge) {
      case "ID Verified":
        return "✅";
      case "Background Checked":
        return "🛡️";
      case "Fixly Trained":
        return "🎓";
      default:
        return "✅";
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
          Text('Verification & Trust', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),
          ...technician.badges.map(
            (badge) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                children: [
                  Text(_getBadgeIcon(badge), style: TextStyle(fontSize: 16.sp)),
                  SizedBox(width: 12.w),
                  Text(
                    badge,
                    style: context.textStyles.bodyText.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
