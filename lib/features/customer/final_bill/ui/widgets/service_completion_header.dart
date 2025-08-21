import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCompletionHeader extends StatelessWidget {
  final FinalBillModel finalBill;

  const ServiceCompletionHeader({super.key, required this.finalBill});

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
        children: [
          // Success icon
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: context.colors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: context.colors.success,
              size: 32.r,
            ),
          ),
          SizedBox(height: 16.h),

          // Completion message
          Text(
            'Payment & Job Completion',
            style: context.textStyles.screenTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          // Success status
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: context.colors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check, color: context.colors.success, size: 16.r),
                  SizedBox(width: 8.w),
                  Text(
                    'The job has been completed successfully!',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: context.colors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Service details
          _buildServiceDetail(context, 'Booking ID', finalBill.bookingId),
          SizedBox(height: 8.h),
          _buildServiceDetail(
            context,
            'Service',
            '${finalBill.serviceName} Repair',
          ),
          SizedBox(height: 8.h),
          _buildServiceDetail(context, 'Technician', finalBill.technicianName),
        ],
      ),
    );
  }

  Widget _buildServiceDetail(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: context.textStyles.bodyText.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(value, style: context.textStyles.bodyTextBold),
      ],
    );
  }
}
