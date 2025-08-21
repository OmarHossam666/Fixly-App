import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/technician_profile/data/technicians_data.dart';
import 'package:fixly/features/customer/technician_profile/models/technician_model.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/book_technician_button.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_about_card.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_profile_app_bar.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_profile_header.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_reviews_card.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_specialties_card.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_statistics_card.dart';
import 'package:fixly/features/customer/technician_profile/ui/widgets/technician_verification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TechnicianProfileScreen extends StatelessWidget {
  final int? technicianId;

  const TechnicianProfileScreen({super.key, this.technicianId});

  @override
  Widget build(BuildContext context) {
    // Get technician data - using first technician as default for demo
    final TechnicianModel technician = technicianId != null
        ? TechniciansData.availableTechnicians.firstWhere(
            (tech) => tech.id == technicianId,
            orElse: () => TechniciansData.availableTechnicians.first,
          )
        : TechniciansData.availableTechnicians.first;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          // Custom App Bar
          TechnicianProfileAppBar(onBackPressed: () => context.pop()),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  // Profile Header
                  TechnicianProfileHeader(technician: technician),
                  SizedBox(height: 24.h),

                  // Key Statistics
                  TechnicianStatisticsCard(technician: technician),
                  SizedBox(height: 24.h),

                  // About Me
                  TechnicianAboutCard(technician: technician),
                  SizedBox(height: 24.h),

                  // Verification & Trust
                  TechnicianVerificationCard(technician: technician),
                  SizedBox(height: 24.h),

                  // Services & Specialties
                  TechnicianSpecialtiesCard(technician: technician),
                  SizedBox(height: 24.h),

                  // Ratings & Reviews
                  TechnicianReviewsCard(technician: technician),
                  SizedBox(height: 100.h), // Space for sticky button
                ],
              ),
            ),
          ),
        ],
      ),

      // Sticky Book Button
      bottomNavigationBar: BookTechnicianButton(
        technician: technician,
        onPressed: () {
          // Handle booking action
          _handleBookTechnician(context, technician);
        },
      ),
    );
  }

  void _handleBookTechnician(BuildContext context, TechnicianModel technician) {
    // Show confirmation dialog or navigate to booking summary
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Book ${technician.name}?',
          style: context.textStyles.cardTitle,
        ),
        content: Text(
          'Are you sure you want to book ${technician.name} for your service?',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              context.push(
                CustomerRoutes.reviewBookingDetailsScreen,
                extra: technician,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.accent,
              foregroundColor: context.colors.textOnAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text('Confirm', style: context.textStyles.primaryButton),
          ),
        ],
      ),
    );
  }
}
