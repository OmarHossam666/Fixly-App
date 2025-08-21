import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/onboarding/models/onboarding_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingData onboardingData;

  const OnboardingPageWidget({super.key, required this.onboardingData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie Animation Container
          Container(
            width: 280.w,
            height: 280.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            ),
            child: Center(
              child: SizedBox(
                width: 200.w,
                height: 200.h,
                child: Lottie.asset(
                  onboardingData.lottieFilePath,
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
            ),
          ),
          SizedBox(height: 48.h),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Text(
                  onboardingData.title,
                  style: context.textStyles.headline,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  onboardingData.subtitle,
                  style: context.textStyles.sectionHeader.copyWith(
                    color: context.colors.accent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Text(
                  onboardingData.description,
                  style: context.textStyles.bodyTextSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
