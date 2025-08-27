import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/photo_name_services_rating.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/view_profile_book_now_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';

class FixlyTechnicianCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final List<String> profession;
  final double rating;
  final int jobsCount;
  final String distance;
  final bool availabilityStatus;
  final String timeAway;
  final String price;
  final bool isFixlyFlash;
  final String? profileImagePath;
  final bool isIdVerified;
  final bool isBackgroundChecked;
  final bool isFixlyTrained;

  const FixlyTechnicianCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.profession,
    required this.rating,
    required this.jobsCount,
    required this.distance,
    required this.availabilityStatus,
    required this.timeAway,
    required this.price,
    this.isFixlyFlash = false,
    this.profileImagePath,
    this.isIdVerified = false,
    this.isBackgroundChecked = false,
    this.isFixlyTrained = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SurfaceDark(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          padding: EdgeInsets.all(14.r),
          borderRadiusAll: true,
          allRadius: 20.r,
          borderColorAll: true,
          borderColor: context.colors.background,
          borderWidth: 1.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with profile and badge
              PhotoNameServicesRating(
                firstName: firstName,
                lastName: lastName,
                profession: profession,
                rating: rating,
                jobsCount: jobsCount,
              ),
              // Badge
              SizedBox(height: 16.h),

              // Verification badges
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isIdVerified)
                    SurfaceDark(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      borderRadiusAll: true,
                      allRadius: 12,
                      surfaceColor: context.colors.success.withAlpha(25),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: context.colors.success,
                            size: 8.sp,
                          ),
                          SizedBox(width: 4.w),

                          Text(
                            'ID Verified',
                            style: context.textStyles.bold14Text.copyWith(
                              color: context.colors.success,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isIdVerified && (isBackgroundChecked || isFixlyTrained))
                    SizedBox(width: 3.w),
                  if (isBackgroundChecked)
                    SurfaceDark(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      borderRadiusAll: true,
                      allRadius: 12.r,
                      surfaceColor: context.colors.facebook.withAlpha(25),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: context.colors.facebook,
                            size: 8.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Background Checked',
                            style: context.textStyles.bold14Text.copyWith(
                              color: context.colors.facebook,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isBackgroundChecked && isFixlyTrained)
                    SizedBox(width: 3.w),
                  if (isFixlyTrained)
                    SurfaceDark(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      borderRadiusAll: true,
                      surfaceColor: context.colors.accent.withAlpha(25),

                      allRadius: 12.r,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.school,
                            color: context.colors.accent,
                            size: 8.sp,
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            'Fixly Trained',
                            style: context.textStyles.bold14Text.copyWith(
                              color: context.colors.accent,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              // Availability and distance
              Row(
                children: [
                  horizontalSpacing(85),

                  Icon(
                    Icons.access_time,
                    color: const Color(0xFF94A3B8),
                    size: 16.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    availabilityStatus ? "Available now" : "Unavailable",
                    style: context.textStyles.bold14Text.copyWith(
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                  Text(
                    ' • ',
                    style: context.textStyles.bold14Text.copyWith(
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                  Text(
                    timeAway,
                    style: context.textStyles.bold14Text.copyWith(
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.h),

              // Distance and price
              Row(
                children: [
                  horizontalSpacing(85),

                  Icon(
                    Icons.location_on,
                    color: const Color(0xFF94A3B8),
                    size: 16.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    distance,
                    style: context.textStyles.bold14Text.copyWith(
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    price,
                    style: context.textStyles.screenTitle.copyWith(
                      color: context.colors.success,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Action buttons
              const ViewProfileBookNowRow(),
            ],
          ),
        ),
        if (isFixlyFlash)
          Positioned(
            top: 0.h,
            right: 6.w,
            child: SurfaceDark(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              surfaceColor: context.colors.accent,
              borderRadiusAll: true,
              allRadius: 20.r,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.flash_on,
                    color: context.colors.textOnAccent,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'FIXLY FLASH',
                    style: context.textStyles.bold14Text.copyWith(
                      color: context.colors.textOnAccent,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
