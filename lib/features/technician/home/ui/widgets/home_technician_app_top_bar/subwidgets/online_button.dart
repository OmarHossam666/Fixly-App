import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/subwidgets/green_status_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnlineButton extends StatefulWidget {
  const OnlineButton({super.key});

  @override
  State<OnlineButton> createState() => _OnlineButtonState();
}

class _OnlineButtonState extends State<OnlineButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkColors.primaryButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OnlineGreenDot(),
            horizontalSpacing(7),
            Text(
              AppStrings.onlineReceivingJobs,
              style: AppStyles.dark.onlineButton,
            ),
          ],
        ),
      ),
    );
  }
}
