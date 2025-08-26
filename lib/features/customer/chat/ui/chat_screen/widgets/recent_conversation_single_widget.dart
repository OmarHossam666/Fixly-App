import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentConversationSingleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color circleColor;
  final String time;

  const RecentConversationSingleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: SurfaceDark(
        borderRadiusAll: true,
        allRadius: 15.r,
        padding: EdgeInsets.all(16.r),
        borderWidth: 2,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: circleColor,
                  child: Icon(icon, color: context.colors.background),
                ),
              ),

              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.sectionHeader.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(subtitle, style: context.textStyles.bodyTextSmall),
                  ],
                ),
              ),

              Text(
                time,
                style: context.textStyles.bodyTextSmall.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
