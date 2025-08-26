import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  Icons.settings,
                  size: 20.sp,
                  color: context.colors.background,
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: context.colors.accent,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.bolt,
                    size: 6.sp,
                    color: context.colors.background,
                  ),
                ),
              ),
            ],
          ),
        ),
        horizontalSpacing(10),
        Text.rich(
          TextSpan(
            children: [

              TextSpan(
                text: LocaleKeys.app_identity_app_english_name.tr(),
                style: context.textStyles.screenTitle,
              ),
              TextSpan(
                text: "\n${LocaleKeys.app_identity_app_arabic_name.tr()}",
                style: context.textStyles.logoSubtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
