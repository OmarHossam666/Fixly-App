import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/custom_elevated_button.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AcceptRejectButtons extends StatelessWidget {
  const AcceptRejectButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomElevatedButton(
            color: context.colors.lightRed,
            text: LocaleKeys.job_actions_reject.tr(),
            height: 40,
            radius: 10,
          ),
        ),
        horizontalSpacing(15),
        Expanded(
          child: CustomElevatedButton(
            color: context.colors.success,
            text: LocaleKeys.job_actions_accept.tr(),
            height: 40,
            radius: 10,
          ),
        ),
      ],
    );
  }
}
