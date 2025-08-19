import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AcceptRejectButtons extends StatelessWidget {
  const AcceptRejectButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          color: context.colors.lightRed,
          text: "Reject",
          width: 137,
          height: 40,
          radius: 10,
        ),
        horizontalSpacing(10),
        CustomElevatedButton(
          color: context.colors.success,
          text: 'Accept',
          width: 137,
          height: 40,
          radius: 10,
        ),
      ],
    );
  }
}
