import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/who_are_you/ui/widgets/feature_item.dart';
import 'package:flutter/material.dart';

class IProvideServicesFeatureItems extends StatelessWidget {
  const IProvideServicesFeatureItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeatureItem(
                icon: Icons.schedule,
                text: 'Flexible scheduling',
                context: context,
                color: context.colors.accent,
              ),
              verticalSpacing(12),
              FeatureItem(
                icon: Icons.star_rate,
                text: 'Customer reviews',
                color: context.colors.accent,
                context: context,
              ),
            ],
          ),
        ),
        horizontalSpacing(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeatureItem(
                icon: Icons.flash_on,
                text: 'Instant payments',
                context: context,
                color: context.colors.accent,
              ),
              verticalSpacing(12),
              FeatureItem(
                icon: Icons.business_center,
                text: 'Business tools',
                context: context,
                color: context.colors.accent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
