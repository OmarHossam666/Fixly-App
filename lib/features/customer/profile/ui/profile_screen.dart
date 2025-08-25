import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/profile_data.dart';
import 'widgets/profile_header.dart';
import 'widgets/contact_info_section.dart';
import 'widgets/menu_section.dart';
import 'widgets/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              // Profile Header
              const ProfileHeader(profile: ProfileData.profileData),
              SizedBox(height: 32.h),

              // Contact Information
              const ContactInfoSection(profile: ProfileData.profileData),
              SizedBox(height: 32.h),

              // Menu Sections
              ...ProfileData.menuSections.map(
                (section) => Column(
                  children: [
                    MenuSection(
                      section: section,
                      onMenuItemTap: _handleMenuPress,
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),

              // Logout Button
              LogoutButton(onTap: () => _handleMenuPress('Logout')),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuPress(String item) {
    // TODO: Implement navigation or actions based on menu item
    // This can be extended to use GoRouter for navigation
    debugPrint('Menu item pressed: $item');
  }
}
