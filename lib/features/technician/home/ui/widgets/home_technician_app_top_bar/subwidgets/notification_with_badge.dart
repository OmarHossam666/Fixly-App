import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWithBadge extends StatelessWidget {
  const NotificationWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.notifications, color: AppColors.darkColors.accent),
        Positioned(
          right: -3,
          top: -9,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
            constraints: BoxConstraints(minHeight: 18.w, minWidth: 18.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkColors.notificationBadge,
            ),
            child: Text(
              "1",
              style: AppStyles.dark.logoSubtitle.copyWith(
                color: AppColors.darkColors.textOnAccent,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
