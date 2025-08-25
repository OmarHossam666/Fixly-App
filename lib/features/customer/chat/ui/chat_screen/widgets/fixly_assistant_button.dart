import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FixlyAssistantButton extends StatelessWidget {
  const FixlyAssistantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(CustomerRoutes.fixlyAssistantScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.accent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.colors.textOnAccent,
              child: Icon(Icons.psychology, color: context.colors.accent),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fixly Assistant",
                    style: context.textStyles.bodyTextBold,
                  ),
                  horizontalSpacing(4),
                  Text(
                    "Get quick diagnosis and step-by-step help",
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: context.colors.textOnAccent,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: context.colors.textOnAccent),
          ],
        ),
      ),
    );
  }
}
