import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/menu_item_model.dart';

class MenuSection extends StatelessWidget {
  final MenuSectionModel section;
  final Function(String) onMenuItemTap;

  const MenuSection({
    super.key,
    required this.section,
    required this.onMenuItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: context.textStyles.sectionHeader.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: context.colors.borderLight),
            ),
            child: Column(
              children: section.items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isLast = index == section.items.length - 1;

                return _buildMenuItem(context, item, showDivider: !isLast);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    MenuItemModel item, {
    bool showDivider = false,
  }) {
    return InkWell(
      onTap: () => onMenuItemTap(item.title),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    color: context.colors.borderLight,
                    width: 1.w,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: context.colors.surfaceSecondary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                item.icon,
                size: 20.sp,
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: context.textStyles.bodyTextBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.subtitle,
                    style: context.textStyles.bodyText.copyWith(
                      fontSize: 14.sp,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20.sp,
              color: context.colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
