import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/technician/profile/ui/widgets/metric_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianPerformanceMetrics extends StatelessWidget {
  const TechnicianPerformanceMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Performance Metrics", style: context.textStyles.bodyTextBold),
        verticalSpacing(12),
        SurfaceDark(
          borderColorAll: true,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          allRadius: 12,
          borderRadiusAll: true,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 13),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],

          child: Column(
            children: [
              MetricRow(
                title: "Acceptance Rate",
                value: "95%",
                valueColor: context.colors.success,
              ),
              verticalSpacing(10),
              MetricRow(
                title: "On-Time Arrival",
                value: "98%",
                valueColor: context.colors.facebook,
              ),
              verticalSpacing(10),
              MetricRow(
                title: "Customer Rating",
                value: "4.8",
                suffixIcon: Icon(
                  Icons.star,
                  size: 16.sp,
                  color: context.colors.starColor,
                ),
                valueColor: context.colors.starColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
