import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/who_are_you_screen/ui/widgets/feature_item.dart';
import 'package:flutter/material.dart';

class INeedServicesFeatureItems extends StatelessWidget {
  const INeedServicesFeatureItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.verified,
                                    text: 'Verified Technicians',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.security,
                                    text: 'Secure Payments',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpacing(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.track_changes,
                                    text: 'Real-time Tracking',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.verified_user,
                                    text: 'Quality Guarantee',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
  }
}