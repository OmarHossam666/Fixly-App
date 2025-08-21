import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/rating_and_review/models/rating_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplimentTagsWidget extends StatelessWidget {
  final List<ComplimentTag> compliments;
  final Function(String) onComplimentToggled;

  const ComplimentTagsWidget({
    super.key,
    required this.compliments,
    required this.onComplimentToggled,
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
          Text('What did you like?', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Compliment tags
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: compliments.map((compliment) {
              return _buildComplimentTag(context, compliment);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildComplimentTag(BuildContext context, ComplimentTag compliment) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: () => onComplimentToggled(compliment.id),
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: compliment.isSelected
                ? context.colors.accent
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: compliment.isSelected
                  ? context.colors.accent
                  : context.colors.borderLight,
              width: 1.w,
            ),
          ),
          child: Text(
            compliment.label,
            style: context.textStyles.bodyTextSmall.copyWith(
              color: compliment.isSelected ? Colors.white : context.colors.text,
              fontWeight: compliment.isSelected
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
