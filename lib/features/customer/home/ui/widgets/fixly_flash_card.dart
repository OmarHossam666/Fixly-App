import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixlyFlashCard extends StatelessWidget {
  final VoidCallback onTap;
  final Color accentColor;
  final Color backgroundColor;

  const FixlyFlashCard({
    super.key,
    required this.onTap,
    required this.accentColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 32.h),
      child: Material(
        borderRadius: BorderRadius.circular(20.r),
        elevation: 8,
        shadowColor: accentColor.withValues(alpha: 0.3),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withValues(alpha: 0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(24.w),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: context.colors.background,
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Icon(
                          Icons.bolt,
                          size: 28.sp,
                          color: accentColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.technician_verification_fixly_flash.tr(),
                              style: context.textStyles.screenTitle.copyWith(
                                color: backgroundColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              LocaleKeys.questions_need_technician_urgently.tr(),
                              style: context.textStyles.bodyText.copyWith(
                                color: context.colors.textOnAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, size: 24.sp, color: backgroundColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
