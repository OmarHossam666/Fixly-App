import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarsWidget extends StatelessWidget {
  final int starsNumber;
  const StarsWidget({super.key, required this.starsNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starsNumber, (index) {
        return Icon(
          Icons.star,
          size: 10.r,
          color: AppColors.darkColors.starColor,
        );
      }),
    );
  }
}
