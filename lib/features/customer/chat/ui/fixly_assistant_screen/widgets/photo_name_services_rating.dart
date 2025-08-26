import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoNameServicesRating extends StatelessWidget {
  final String firstName;
  final String lastName;
  final List<String> profession;
  final double rating;
  final int jobsCount;

  const PhotoNameServicesRating({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.profession,
    required this.rating,
    required this.jobsCount,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile section
                  Row(
                    children: [
                      Stack(
                        children: [
                          SurfaceDark(
                            width: 60.w,
                            height: 60.h,
                            borderRadiusAll: true,
                            allRadius: 30.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Container(
                                width: 60.w,
                                height: 60.h,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2.h,
                            right: 2.w,
                            child: SurfaceDark(
                              width: 20.w,
                              height: 20.h,
                              surfaceColor: context.colors.success,
                              borderRadiusAll: true,
                              allRadius: 10.r,
                              borderColorAll: true,
                              borderColor: context.colors.black,
                              borderWidth: 2.w,
                              child: Icon(
                                Icons.check,
                                color: context.colors.textOnAccent,
                                size: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$firstName $lastName',
                            style: context.textStyles.screenTitle,
                          ),
                          Text(
                            profession.join(", "),
                            style: context.textStyles.bold14Text.copyWith(
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                rating.toString(),
                                style: context.textStyles.bold14Text.copyWith(
                                  color: context.colors.textOnAccent,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '($jobsCount+ jobs)',
                                style: context.textStyles.bold14Text.copyWith(
                                  color: const Color(0xFF94A3B8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
;
  }
}