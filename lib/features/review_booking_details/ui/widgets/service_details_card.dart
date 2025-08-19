import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/review_booking_details/models/booking_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsCard extends StatelessWidget {
  final ServiceDetailsModel serviceDetails;
  final BookingDetailsModel bookingDetails;
  final VoidCallback? onEditLocation;

  const ServiceDetailsCard({
    super.key,
    required this.serviceDetails,
    required this.bookingDetails,
    this.onEditLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Service Details', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Service Type
          _DetailRow(
            label: 'Service:',
            value: serviceDetails.serviceType,
            context: context,
          ),
          SizedBox(height: 12.h),

          // Location
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Location:',
                  style: context.textStyles.bodyText.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bookingDetails.address,
                      style: context.textStyles.bodyText.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(height: 4.h),
                    if (onEditLocation != null)
                      GestureDetector(
                        onTap: onEditLocation,
                        child: Text(
                          'Edit',
                          style: context.textStyles.caption.copyWith(
                            color: context.colors.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Date & Time
          _DetailRow(
            label: 'Date & Time:',
            value:
                '${serviceDetails.dateTime} (${serviceDetails.estimatedArrival})',
            context: context,
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

  const _DetailRow({
    required this.label,
    required this.value,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: context.textStyles.bodyText.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: context.textStyles.bodyText.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
