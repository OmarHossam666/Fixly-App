import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/booking_confirmation/models/booking_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveTrackingCard extends StatelessWidget {
  final BookingConfirmationModel booking;

  const LiveTrackingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Column(
        children: [
          // Map Placeholder
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.surfaceSecondary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: context.colors.accent,
                      size: 48.sp,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Live Tracking',
                      style: context.textStyles.sectionHeader.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${booking.technicianName} is ${booking.distance} away',
                      style: context.textStyles.bodyText.copyWith(
                        color: context.colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ETA Information
          Container(
            padding: EdgeInsets.all(16.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.colors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.directions_car,
                    color: context.colors.success,
                    size: 16.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'ETA: ${booking.estimatedArrival}',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: context.colors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
