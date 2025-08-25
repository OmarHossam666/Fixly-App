import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  final Function(String action, BookingModel booking)? onActionPressed;

  const BookingCard({super.key, required this.booking, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status and Service Header
          _buildHeader(context),
          SizedBox(height: 16.h),

          // Technician Info
          _buildTechnicianInfo(context),
          SizedBox(height: 12.h),

          // Time and Location
          _buildTimeAndLocation(context),
          SizedBox(height: 16.h),

          // Action Buttons
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booking.service,
                style: context.textStyles.cardTitle.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(
                    _getStatusIcon(),
                    size: 16.r,
                    color: _getStatusColor(context),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    booking.status.displayName,
                    style: context.textStyles.bodyTextBold.copyWith(
                      fontSize: 14.sp,
                      color: _getStatusColor(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          booking.formattedPrice,
          style: context.textStyles.cardTitle.copyWith(
            fontSize: 18.sp,
            color: context.colors.accent,
          ),
        ),
      ],
    );
  }

  Widget _buildTechnicianInfo(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(Icons.person, size: 16.r, color: Colors.white),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            booking.technician.name,
            style: context.textStyles.bodyTextBold.copyWith(fontSize: 16.sp),
          ),
        ),
        if (booking.technician.rating != null) ...[
          Icon(
            Icons.star,
            size: 16.r,
            color: AppColors.colors(context).starColor,
          ),
          SizedBox(width: 4.w),
          Text(
            booking.technician.rating!.toStringAsFixed(1),
            style: context.textStyles.bodyTextSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTimeAndLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Row(
            children: [
              Icon(
                Icons.schedule,
                size: 16.r,
                color: context.colors.textSecondary,
              ),
              SizedBox(width: 8.w),
              Text(
                booking.date,
                style: context.textStyles.bodyText.copyWith(
                  color: context.colors.textSecondary,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                '• ${booking.estimatedTime}',
                style: context.textStyles.bodyText.copyWith(
                  color: context.colors.textSecondary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16.r,
              color: context.colors.textSecondary,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                booking.location,
                style: context.textStyles.bodyText.copyWith(
                  color: context.colors.textSecondary,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final actions = _getAvailableActions();
    if (actions.isEmpty) return const SizedBox.shrink();

    return Row(
      children: actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        final isLast = index == actions.length - 1;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 12.w),
            child: _buildActionButton(context, action),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButton(BuildContext context, String action) {
    final isPrimary = _isPrimaryAction(action);

    return SizedBox(
      height: 44.h,
      child: ElevatedButton(
        onPressed: () => onActionPressed?.call(action, booking),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? context.colors.accent
              : context.colors.surface,
          foregroundColor: isPrimary
              ? Colors.white
              : context.colors.textSecondary,
          elevation: 0,
          side: isPrimary
              ? null
              : BorderSide(color: context.colors.borderLight, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getActionIcon(action), size: 16.r),
            SizedBox(width: 8.w),
            Text(
              action,
              style: context.textStyles.bodyTextBold.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon() {
    switch (booking.status) {
      case BookingStatus.upcoming:
        return Icons.schedule;
      case BookingStatus.inProgress:
        return Icons.hourglass_empty;
      case BookingStatus.completed:
        return Icons.check_circle;
      case BookingStatus.cancelled:
        return Icons.cancel;
    }
  }

  Color _getStatusColor(BuildContext context) {
    switch (booking.status) {
      case BookingStatus.upcoming:
        return context.colors.accent;
      case BookingStatus.inProgress:
        return context.colors.success;
      case BookingStatus.completed:
        return context.colors.textSecondary;
      case BookingStatus.cancelled:
        return context.colors.error;
    }
  }

  List<String> _getAvailableActions() {
    switch (booking.status) {
      case BookingStatus.upcoming:
        return ['Call', 'Cancel'];
      case BookingStatus.inProgress:
        return ['Track Progress'];
      case BookingStatus.completed:
        return ['Book Again'];
      case BookingStatus.cancelled:
        return ['Book Again'];
    }
  }

  bool _isPrimaryAction(String action) {
    return action == 'Call' ||
        action == 'Track Progress' ||
        action == 'Book Again';
  }

  IconData _getActionIcon(String action) {
    switch (action) {
      case 'Call':
        return Icons.phone;
      case 'Cancel':
        return Icons.close;
      case 'Track Progress':
        return Icons.track_changes;
      case 'Book Again':
        return Icons.refresh;
      default:
        return Icons.touch_app;
    }
  }
}
