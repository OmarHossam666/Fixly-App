import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/home/models/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;
  final Color surfaceColor;
  final Color borderColor;
  final Color textColor;
  final Color textSecondaryColor;
  final Color backgroundColor;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
    required this.surfaceColor,
    required this.borderColor,
    required this.textColor,
    required this.textSecondaryColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16.r),
      elevation: 2,
      shadowColor: const Color(0xFF6366F1).withValues(alpha: 0.05),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: borderColor, width: 2.w),
          ),
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: service.color,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Icon(service.icon, size: 28.sp, color: backgroundColor),
              ),
              SizedBox(height: 12.h),
              FittedBox(
                child: Text(service.name, style: context.textStyles.cardTitle),
              ),
              SizedBox(height: 6.h),
              FittedBox(
                child: Text(
                  service.description,
                  style: context.textStyles.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
