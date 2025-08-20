import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianReviewsCard extends StatelessWidget {
  final TechnicianModel technician;

  const TechnicianReviewsCard({super.key, required this.technician});

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
          Text('Ratings & Reviews', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),
          ...technician.reviews.asMap().entries.map((entry) {
            final index = entry.key;
            final review = entry.value;
            final isLast = index == technician.reviews.length - 1;

            return Column(
              children: [
                _ReviewItem(review: review),
                if (!isLast) ...[
                  SizedBox(height: 16.h),
                  Divider(color: context.colors.borderLight, height: 1.h),
                  SizedBox(height: 16.h),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final TechnicianReview review;

  const _ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.name,
              style: context.textStyles.bodyTextBold.copyWith(
                color: context.colors.text,
              ),
            ),
            Row(
              children: [
                Text('⭐', style: TextStyle(fontSize: 18.sp)),
                SizedBox(width: 4.w),
                Text(
                  review.rating.toString(),
                  style: context.textStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          review.comment,
          style: context.textStyles.bodyTextSmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          review.date,
          style: context.textStyles.caption.copyWith(
            color: context.colors.textTertiary,
          ),
        ),
      ],
    );
  }
}
