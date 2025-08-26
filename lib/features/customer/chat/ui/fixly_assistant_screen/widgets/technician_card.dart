import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/available_now.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/distance_widget.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/profile_photo_name_fixly_flash_widgets.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/services_widget.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/view_profile_book_now_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String distance;
  final double rating;
  final bool flash;
  final List<String> services;
  final bool verified;
  final bool available;

  const TechnicianCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.distance,
    required this.rating,
    required this.flash,
    required this.services,
    required this.verified,
    required this.available,
  });
  @override
  Widget build(BuildContext context) {
    return SurfaceDark(
      allRadius: 12,
      borderRadiusAll: true,
      borderColorAll: true,
      padding: EdgeInsets.all(16.0.r),
      margin: EdgeInsets.only(bottom: 16.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Profile, Name, and Flash Badge
          ProfilePhotoNameFixlyFlashWidgets(
            firstName: firstName,
            lastName: lastName,
            rating: rating,
            flash: flash,
            verified: verified,
          ),
          verticalSpacing(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (services.isNotEmpty) ...[ServicesWidget(services: services)],
              if (services.isNotEmpty) verticalSpacing(12),
              // Availability and Distance
              Column(
                children: [
                  AvailableNow(available: available),

                  verticalSpacing(4),

                  DistanceWidget(distance: distance),
                ],
              ),
            ],
          ),

          verticalSpacing(16),

          // Action Buttons
          ViewProfileBookNowRow(available: available),
        ],
      ),
    );
  }
}
