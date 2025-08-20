import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingActionButtons extends StatelessWidget {
  final VoidCallback? onStartService;
  final VoidCallback? onCancelBooking;
  final bool showStartService;

  const BookingActionButtons({
    super.key,
    this.onStartService,
    this.onCancelBooking,
    this.showStartService = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Start Service Button
        if (showStartService) ...[
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onStartService,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.success,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Start Service',
                style: context.textStyles.primaryButton.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],

        // Cancel Button
        TextButton(
          onPressed: onCancelBooking,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(
            'Cancel Booking',
            style: context.textStyles.bodyText.copyWith(
              color: context.colors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
