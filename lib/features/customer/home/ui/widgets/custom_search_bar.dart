import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onChanged;
  final VoidCallback onSearch;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;

  const CustomSearchBar({
    super.key,
    required this.searchQuery,
    required this.onChanged,
    required this.onSearch,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 32.h),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withValues(alpha: 0.05),
              offset: Offset(0, 2.h),
              blurRadius: 8.r,
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextField(
          onChanged: onChanged,
          onSubmitted: (_) => onSearch(),
          style: context.textStyles.bodyTextBold,
          decoration: InputDecoration(
            hintText: LocaleKeys.search_and_discovery_search_placeholder.tr(),
            hintStyle: context.textStyles.bodyTextSmall,
            prefixIcon: Icon(Icons.search, size: 20.sp, color: hintColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
          ),
        ),
      ),
    );
  }
}
