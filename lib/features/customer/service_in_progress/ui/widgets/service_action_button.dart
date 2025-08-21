import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceActionButton extends StatelessWidget {
  final ServiceStatus currentStatus;
  final VoidCallback? onCompleteService;

  const ServiceActionButton({
    super.key,
    required this.currentStatus,
    this.onCompleteService,
  });

  @override
  Widget build(BuildContext context) {
    // Only show the complete button when repairing
    if (currentStatus != ServiceStatus.repairing) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: ElevatedButton(
          onPressed: onCompleteService,
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.success,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Mark Service as Complete',
            style: context.textStyles.primaryButton.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
