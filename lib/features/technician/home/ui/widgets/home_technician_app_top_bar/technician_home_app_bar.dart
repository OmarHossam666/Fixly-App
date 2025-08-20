import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/subwidgets/logo_and_title.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/subwidgets/notification_with_badge.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/subwidgets/online_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianHomeAppBar extends StatelessWidget {
  const TechnicianHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SurfaceDark(
      height: 165.h,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LogoAndTitle(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const NotificationWithBadge(),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.darkColors.surfaceElevated,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacing(15),
            const OnlineButton(),
          ],
        ),
      ),
    );
  }
}
