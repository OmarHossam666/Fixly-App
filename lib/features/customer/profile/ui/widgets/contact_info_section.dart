import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/profile_model.dart';

class ContactInfoSection extends StatelessWidget {
  final ProfileModel profile;

  const ContactInfoSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
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
              children: [
                _buildContactItem(
                  context,
                  Icons.email,
                  'Email',
                  profile.email,
                  context.colors.accent,
                  showDivider: true,
                ),
                _buildContactItem(
                  context,
                  Icons.phone,
                  'Phone',
                  profile.phone,
                  context.colors.primary,
                  showDivider: true,
                ),
                _buildContactItem(
                  context,
                  Icons.location_on,
                  'Address',
                  profile.address,
                  const Color(0xFF10B981),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color iconColor, {
    bool showDivider = false,
  }) {
    return Container(
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
              color: iconColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(icon, size: 20.sp, color: context.colors.textOnAccent),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.textStyles.bodyText.copyWith(
                    fontSize: 14.sp,
                    color: context.colors.textSecondary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: context.textStyles.bodyTextBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
