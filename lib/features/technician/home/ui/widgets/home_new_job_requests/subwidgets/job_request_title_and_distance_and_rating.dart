import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/stars_widget.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class JobRequestTitleAndDistanceAndRating extends StatelessWidget {
  const JobRequestTitleAndDistanceAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.services_electrical_wiring.tr(), style: AppStyles.dark.cardTitle),
        Text(LocaleKeys.distances_and_locations_onehalf_km_away.tr(), style: AppStyles.dark.bodyText),

        Row(
          children: [
            const StarsWidget(starsNumber: 5),
            horizontalSpacing(5),
            Text(LocaleKeys.metrics_and_stats_average_rating.tr(), style: context.textStyles.logoSubtitle),
          ],
        ),
      ],
    );
  }
}
