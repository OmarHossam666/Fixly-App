import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/customer/home/logic/service_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixly/features/customer/home/models/service.dart';

Widget buildServiceItem(
  BuildContext context,
  Map<String, dynamic> subservice,
  Service service,
  Color categoryColor,
) {
  return InkWell(
    onTap: () => handleServiceSelect(context, service.name),
    child: SurfaceDark(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      borderRadiusAll: true,
      allRadius: 12,
      borderColorAll: true,
      boxShadow: [
        BoxShadow(
          color: context.colors.black,
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ],

      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Icon(subservice['icon'], size: 24.r, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subservice['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subservice['description'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 20, color: Color(0xFF9CA3AF)),
        ],
      ),
    ),
  );
}
