import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyBookingsWidget extends StatelessWidget {
  final BookingStatus? filterStatus;
  final VoidCallback? onBookServicePressed;

  const EmptyBookingsWidget({
    super.key,
    this.filterStatus,
    this.onBookServicePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty state icon
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: context.colors.surfaceSecondary,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Icon(
                _getEmptyStateIcon(),
                size: 36.r,
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 24.h),

            // Title
            Text(
              _getEmptyStateTitle(),
              style: context.textStyles.cardTitle.copyWith(fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),

            // Description
            Text(
              _getEmptyStateDescription(),
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            // Action button (only for general empty state)
            if (filterStatus == null && onBookServicePressed != null) ...[
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: onBookServicePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.accent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Book a Service',
                    style: context.textStyles.bodyTextBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getEmptyStateIcon() {
    if (filterStatus == null) {
      return Icons.calendar_today;
    }

    switch (filterStatus!) {
      case BookingStatus.upcoming:
        return Icons.schedule;
      case BookingStatus.inProgress:
        return Icons.hourglass_empty;
      case BookingStatus.completed:
        return Icons.check_circle_outline;
      case BookingStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }

  String _getEmptyStateTitle() {
    if (filterStatus == null) {
      return 'No Bookings Yet';
    }

    switch (filterStatus!) {
      case BookingStatus.upcoming:
        return 'No Upcoming Bookings';
      case BookingStatus.inProgress:
        return 'No Active Services';
      case BookingStatus.completed:
        return 'No Completed Services';
      case BookingStatus.cancelled:
        return 'No Cancelled Bookings';
    }
  }

  String _getEmptyStateDescription() {
    if (filterStatus == null) {
      return 'Your repair appointments will appear here';
    }

    switch (filterStatus!) {
      case BookingStatus.upcoming:
        return 'You don\'t have any upcoming bookings.';
      case BookingStatus.inProgress:
        return 'No services are currently in progress.';
      case BookingStatus.completed:
        return 'You haven\'t completed any services yet.';
      case BookingStatus.cancelled:
        return 'You don\'t have any cancelled bookings.';
    }
  }
}
