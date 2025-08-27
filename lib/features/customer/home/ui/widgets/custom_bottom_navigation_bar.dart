import 'package:easy_localization/easy_localization.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, -2.h),
            blurRadius: 10.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedLabelStyle: context.textStyles.logoSubtitle,
          unselectedLabelStyle: context.textStyles.caption,
          elevation: 0,
          items:  [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: LocaleKeys.navigation_labels_home.tr(),
              activeIcon: const Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_outlined),
              label: LocaleKeys.navigation_labels_chat.tr(),
              activeIcon: const Icon(Icons.chat),
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.book_online_outlined),
              label: LocaleKeys.navigation_labels_my_bookings.tr(),
              activeIcon: const Icon(Icons.book_online),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              label: LocaleKeys.navigation_labels_profile.tr(),
              activeIcon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
