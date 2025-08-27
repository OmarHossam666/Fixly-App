import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:fixly/features/customer/home/models/service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreenHeader extends StatelessWidget {
  final Service service;
  const ServiceDetailsScreenHeader({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return SurfaceDark(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        bottom: 16,
      ),
      borderColorBottom: true,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SurfaceDark(
              width: 40.w,
              height: 40.w,

              borderRadiusAll: true,
              allRadius: 20,
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Text(
              service.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
