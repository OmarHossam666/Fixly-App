import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_new_job_requests/new_job_requests.dart';
import 'package:fixly/features/technician/home/ui/widgets/stats_overview_widgets.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_technician_app_top_bar/technician_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianHomeScreen extends StatelessWidget {
  const TechnicianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const TechnicianHomeAppBar(),
              verticalSpacing(15),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      StatsOverviewWidgets(),
                      verticalSpacing(15),
                      const NewJobRequests(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
