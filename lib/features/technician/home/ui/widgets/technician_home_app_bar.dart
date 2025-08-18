import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/features/technician/home/ui/widgets/logo_and_title.dart';
import 'package:fixly/features/technician/home/ui/widgets/notification_with_badge.dart';
import 'package:fixly/features/technician/home/ui/widgets/online_button.dart';
import 'package:flutter/material.dart';

class TechnicianHomeAppBar extends StatelessWidget {
  const TechnicianHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const OnlineButton(),
      ],
    );
  }
}
