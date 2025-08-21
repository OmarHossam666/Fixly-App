import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/rating_and_review/models/rating_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingWidget extends StatelessWidget {
  final RatingValue currentRating;
  final Function(RatingValue) onRatingChanged;

  const StarRatingWidget({
    super.key,
    required this.currentRating,
    required this.onRatingChanged,
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
        children: [
          // Star buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starValue = index + 1;
              final isSelected = starValue <= currentRating.value;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GestureDetector(
                  onTap: () {
                    onRatingChanged(RatingValue.fromInt(starValue));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.star,
                      size: 48.r,
                      color: isSelected
                          ? context.colors.starColor
                          : context.colors.textTertiary,
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 16.h),

          // Rating description
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              currentRating.description,
              key: ValueKey(currentRating.value),
              style: context.textStyles.bodyText.copyWith(
                color: currentRating == RatingValue.none
                    ? context.colors.textSecondary
                    : context.colors.text,
                fontWeight: currentRating == RatingValue.none
                    ? FontWeight.normal
                    : FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
