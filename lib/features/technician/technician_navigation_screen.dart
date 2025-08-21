import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/features/technician/earnings/ui/technician_earnings_screen.dart';
import 'package:fixly/features/technician/home/ui/technician_home_screen.dart';
import 'package:fixly/features/technician/jobs/ui/technician_jobs_screen.dart';
import 'package:fixly/features/technician/profile/ui/technician_profile_screen.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianNavigationScreen extends StatefulWidget {
  const TechnicianNavigationScreen({super.key});

  @override
  State<TechnicianNavigationScreen> createState() =>
      _TechnicianNavigationScreenState();
}

class _TechnicianNavigationScreenState
    extends State<TechnicianNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TechnicianHomeScreen(),
    const TechnicianJobScreen(),
    const TechnicianEarningsScreen(),
    const TechnicianProfileScreenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: Theme.of(
          context,
        ).bottomNavigationBarTheme.copyWith(enableFeedback: false),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: _NoAnimationPageTransitionsBuilder(),
            TargetPlatform.iOS: _NoAnimationPageTransitionsBuilder(),
          },
        ),
      ),
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: TechnicianCustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: context.colors.background,
          selectedItemColor: context.colors.accent,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T extends Object?>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

class TechnicianCustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const TechnicianCustomBottomNavigationBar({
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
            color: Colors.black.withValues(alpha: 0),
            offset: Offset(0, -2.h),
            blurRadius: 0,
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
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline),
              label: 'Jobs',
              activeIcon: Icon(Icons.work),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_outlined),
              label: 'Earnings',
              activeIcon: Icon(Icons.attach_money),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              activeIcon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
