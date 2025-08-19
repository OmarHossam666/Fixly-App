import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/technician_profile/models/booking_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsReminderCard extends StatelessWidget {
  final BookingConfirmationModel booking;

  const ServiceDetailsReminderCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.primary.withValues(alpha: 0.2),
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Details',
            style: context.textStyles.cardTitle.copyWith(
              color: context.colors.primary,
            ),
          ),
          SizedBox(height: 12.h),

          // Service Type
          _DetailRow(
            label: 'Service:',
            value: booking.serviceType,
            context: context,
          ),
          SizedBox(height: 8.h),

          // Visit Fee
          _DetailRow(
            label: 'Visit Fee:',
            value: '${booking.visitFee} EGP',
            context: context,
          ),
          SizedBox(height: 8.h),

          // Location
          _DetailRow(
            label: 'Location:',
            value: booking.address,
            context: context,
            isMultiline: true,
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final BuildContext context;
  final bool isMultiline;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.context,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isMultiline) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyles.bodyTextSmall.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            value,
            style: context.textStyles.bodyTextSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textStyles.bodyTextSmall.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: context.textStyles.bodyTextSmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
