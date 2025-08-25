import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewProfileBookNowRow extends StatelessWidget {
  final bool available;
  const ViewProfileBookNowRow({super.key, required this.available});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            color: context.colors.facebook,
            text: 'View Profile',
            radius: 10,
            textStyle: context.textStyles.bold14Text,
          ),
        ),
        horizontalSpacing(8),
        Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            color: context.colors.success,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.white, size: 20.w),
          ),
        ),
        horizontalSpacing(8),
        Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            color: context.colors.facebook,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: Colors.white, size: 20.w),
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: ElevatedButton(
            onPressed: available ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: available
                  ? context.colors.accent
                  : context.colors.lightRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Book Now", style: context.textStyles.bold14Text),
          ),
        ),
      ],
    );
  }
}
