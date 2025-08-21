import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLastPage;

  const NextButton({
    super.key,
    required this.onPressed,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primaryButton,
        foregroundColor: context.colors.primaryButtonText,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isLastPage ? 'Get Started' : 'Next',
            style: context.textStyles.primaryButton,
          ),
          SizedBox(width: 8.w),
          Icon(Icons.chevron_right, size: 20.sp),
        ],
      ),
    );
  }
}
