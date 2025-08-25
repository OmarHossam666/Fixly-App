import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget fixlyAssistantAppBar(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: context.colors.surface, // Android only
    ),
  );
  return PreferredSize(
    preferredSize: Size.fromHeight(65.h),
    child: SafeArea(
      child: SurfaceDark(
        borderColorBottom: true,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: context.colors.textOnAccent,
              ),
              onPressed: () => context.pop(),
            ),
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: context.colors.accent,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.psychology,
                color: context.colors.textOnAccent,
                size: 32.w,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fixly Assistant', style: context.textStyles.screenTitle),
                Text(
                  'Online now',
                  style: context.textStyles.bodyTextSmall.copyWith(
                    color: context.colors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
