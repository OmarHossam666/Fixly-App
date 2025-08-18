import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/technician/home/ui/widgets/technician_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianHomeScreen extends StatelessWidget {
  const TechnicianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const TechnicianHomeAppBar(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkColors.primaryButton,
                  ),
                  child: Text(
                    AppStrings.onlineReceivingJobs,
                    style: AppStyles.dark.primaryButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
