import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/subwidgets/green_status_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusOnlineButton extends StatefulWidget {
  const StatusOnlineButton({super.key});

  @override
  State<StatusOnlineButton> createState() => _StatusOnlineButtonState();
}

class _StatusOnlineButtonState extends State<StatusOnlineButton> {
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 65.h,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isOnline = !isOnline;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isOnline
                ? context.colors.primaryButton
                : context.colors.secondaryButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          child: isOnline
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const OnlineGreenDot(),
                    horizontalSpacing(7),
                    Text(
                      AppStrings.onlineReceivingJobs,
                      style: context.textStyles.onlineButton,
                    ),
                  ],
                )
              : Text(
                  AppStrings.offline,
                  style: context.textStyles.onlineButton,
                ),
        ),
      ),
    );
  }
}
