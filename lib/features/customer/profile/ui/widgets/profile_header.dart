import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Avatar and Basic Info
          Column(
            children: [
              CircleAvatar(
                radius: 50.r,
                foregroundImage: AssetImage(profile.image),
                backgroundColor: context.colors.surface,
              ),
              SizedBox(height: 16.h),
              Text(
                profile.name,
                style: context.textStyles.headline.copyWith(fontSize: 24.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                profile.joinDate,
                style: context.textStyles.bodyText.copyWith(
                  color: context.colors.textSecondary,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Stats
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: context.colors.borderLight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  profile.completedServices.toString(),
                  'Services',
                ),
                _buildStatItem(
                  context,
                  profile.rating.toString(),
                  'Rating',
                  showStar: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label, {
    bool showStar = false,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showStar) ...[
              Icon(Icons.star, size: 16.sp, color: context.colors.accent),
              SizedBox(width: 4.w),
            ],
            Text(
              value,
              style: context.textStyles.headline.copyWith(
                fontSize: 20.sp,
                color: context.colors.accent,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: context.textStyles.bodyText.copyWith(
            fontSize: 14.sp,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
