import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneInputWidget extends StatelessWidget {
  final String phoneNumber;
  final ValueChanged<String> onChanged;

  const PhoneInputWidget({
    super.key,
    required this.phoneNumber,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: context.textStyles.screenTitle),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: context.colors.border, width: 2.w),
            color: context.colors.surface,
          ),
          child: Row(
            children: [
              // Country Code Container
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: context.colors.border, width: 1.w),
                  ),
                ),
                child: Text('+20', style: context.textStyles.bodyTextSmall),
              ),

              // Phone Number Input
              Expanded(
                child: TextFormField(
                  cursorColor: context.colors.primary,
                  initialValue: phoneNumber,
                  onChanged: onChanged,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  style: context.textStyles.bodyText,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    hintStyle: context.textStyles.bodyText.copyWith(
                      color: context.colors.textSecondary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
