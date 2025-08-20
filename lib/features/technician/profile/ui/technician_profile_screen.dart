import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/profile/ui/widgets/menu_item.dart';
import 'package:fixly/features/technician/profile/ui/widgets/technician_performance_metrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/constants/app_colors.dart';


class TechnicianProfileScreenPage extends StatelessWidget {
  const TechnicianProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: context.textStyles.screenTitle),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  verticalSpacing(12),
                  Text(
                    "John Technician",
                    style: context.textStyles.bodyTextBold.copyWith(
                      fontSize: 26.sp,
                    ),
                  ),
                  verticalSpacing(4),

                  Text(
                    "Master Technician",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacing(70),
            const TechnicianPerformanceMetrics(),
            verticalSpacing(24),
            MenuItem(
              title: "My Jobs",
              iconData: Icons.work,
              iconColor: context.colors.facebook,
            ),

            verticalSpacing(12),
            MenuItem(
              title: "My Reviews",
              iconData: Icons.star,
              iconColor: context.colors.starColor,
            ),
            verticalSpacing(12),
            MenuItem(
              title: "Documents",
              iconData: Icons.insert_drive_file,
              iconColor: context.colors.success,
            ),
            verticalSpacing(12),
            MenuItem(
              title: "Help Center",
              iconData: Icons.help_outline,
              iconColor: context.colors.facebook,
            ),
          ],
        ),
      ),
    );
  }
}
