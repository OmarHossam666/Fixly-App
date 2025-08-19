import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String worker;
  final String time;
  final String price;
  final String rating;
  final int starsNumber;

  const JobCard({
    super.key,
    required this.title,
    required this.worker,
    required this.time,
    required this.price,
    required this.rating,
    required this.starsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(price, style: context.textStyles.green16Bold),
            ],
          ),
          Text(worker, style: const TextStyle(fontSize: 14)),
          verticalSpacing(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time, style: context.textStyles.bodyTextSmall),
              Row(
                children: [
                  StarsWidget(starsNumber: starsNumber),
                  const SizedBox(width: 4),
                  Text(rating, style: context.textStyles.logoSubtitle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
