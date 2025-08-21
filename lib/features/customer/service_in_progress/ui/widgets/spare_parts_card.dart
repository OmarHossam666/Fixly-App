import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparePartsCard extends StatelessWidget {
  final List<SparePart> spareParts;
  final Function(int) onApprove;
  final Function(int) onReject;

  const SparePartsCard({
    super.key,
    required this.spareParts,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    if (spareParts.isEmpty) {
      return const SizedBox.shrink();
    }

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
          Text('Required Spare Parts', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          ...spareParts.map(
            (part) => Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(color: context.colors.border),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  // Part Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          part.name,
                          style: context.textStyles.bodyTextBold,
                        ),
                      ),
                      Text(
                        '${part.price} EGP',
                        style: context.textStyles.bodyTextBold.copyWith(
                          color: context.colors.accent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Action Buttons
                  if (!part.approved) ...[
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => onApprove(part.id),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.success,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check, size: 16.sp),
                                SizedBox(width: 4.w),
                                Text(
                                  'Approve',
                                  style: context.textStyles.bodyTextSmall
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => onReject(part.id),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.error,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close, size: 16.sp),
                                SizedBox(width: 4.w),
                                Text(
                                  'Reject',
                                  style: context.textStyles.bodyTextSmall
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: context.colors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: context.colors.success,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Approved',
                            style: context.textStyles.bodyTextSmall.copyWith(
                              color: context.colors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
