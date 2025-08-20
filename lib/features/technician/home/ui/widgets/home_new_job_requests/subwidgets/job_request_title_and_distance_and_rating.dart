import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/stars_widget.dart';
import 'package:flutter/material.dart';

class JobRequestTitleAndDistanceAndRating extends StatelessWidget {
  const JobRequestTitleAndDistanceAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.electricalWiring, style: AppStyles.dark.cardTitle),
        Text(AppStrings.onehalfKmAway, style: AppStyles.dark.bodyText),

        Row(
          children: [
            const StarsWidget(starsNumber: 5),
            horizontalSpacing(5),
            Text(4.8.toString(), style: context.textStyles.logoSubtitle),
          ],
        ),
      ],
    );
  }
}
