import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final String text;
  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  const CustomElevatedButton({
    super.key,
    required this.color,
    required this.text,
    this.height,
    this.width,
    this.radius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?.r ?? 15.r),
          ),
        ),
        child: Text(text, style: textStyle ?? context.textStyles.bold14Text),
      ),
    );
  }
}
