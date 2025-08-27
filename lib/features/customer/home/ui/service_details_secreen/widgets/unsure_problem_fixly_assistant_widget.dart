import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/home/logic/service_functions.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnsureProblemFixlyAssistantWidget extends StatelessWidget {
  const UnsureProblemFixlyAssistantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 24.h),
      child: InkWell(
        onTap: () => handleChatbot(context),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: context.colors.accent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(50),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text('🤔', style: TextStyle(fontSize: 20.sp)),
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.chat_and_messaging_unsure_what_the_problem_is.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(
                      LocaleKeys.chat_and_messaging_chat_with_fixly_assistant.tr(),
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, size: 20.sp, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}