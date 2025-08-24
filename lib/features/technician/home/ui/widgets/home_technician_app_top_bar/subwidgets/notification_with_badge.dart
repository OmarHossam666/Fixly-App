import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotificationWithBadge extends StatelessWidget {
  const NotificationWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Notifications"),
                  content: Text("You don't have new notifications."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Close",
                        style: context.textStyles.logoSubtitle,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.notifications, color: AppColors.darkColors.accent),
        ),
        Positioned(
          right: 9.w,
          top: 2.h,
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
