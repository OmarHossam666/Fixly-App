import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/home/logic/service_functions.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SomethingElseWidget extends StatelessWidget {
  const SomethingElseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleUnsure(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF374151),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF4B5563),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xFF6B7280),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.help_outline,
                size: 24,
                color: Colors.white,
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.chat_and_messaging_something_else.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,

                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  verticalSpacing(4),
                  Text(
                    LocaleKeys
                        .chat_and_messaging_let_assistant_help_you_identify_the_problem
                        .tr(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF9CA3AF),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 20.r, color: const Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}
