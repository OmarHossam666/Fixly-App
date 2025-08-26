import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTextWidget extends StatelessWidget {
  final String reviewText;
  final Function(String) onReviewTextChanged;
  final int maxLength;

  const ReviewTextWidget({
    super.key,
    required this.reviewText,
    required this.onReviewTextChanged,
    this.maxLength = 500,
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
          Text(
            'Write a Review (Optional)',
            style: context.textStyles.sectionHeader,
          ),
          verticalSpacing(16),

          // Text field
          TextField(
            onChanged: onReviewTextChanged,
            maxLines: 4,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: 'Share your experience with other users...',
              hintStyle: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.borderLight,
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.borderLight,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.accent,
                  width: 2.w,
                ),
              ),
              contentPadding: EdgeInsets.all(16.r),
              counterStyle: context.textStyles.caption.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            style: context.textStyles.bodyText,
            textInputAction: TextInputAction.newline,
          ),
        ],
      ),
    );
  }
}
