import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.darkColors.primary,
          foregroundColor: AppColors.darkColors.primaryButtonText,
          child: const Icon(Icons.settings),
        ),
        horizontalSpacing(10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.appEnglishName,
                style: AppStyles.dark.screenTitle,
              ),
              TextSpan(
                text: "\n${AppStrings.appArabicName}",
                style: AppStyles.dark.logoSubtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
