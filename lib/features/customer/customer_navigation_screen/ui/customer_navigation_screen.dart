import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/features/customer/booking/ui/my_bookings_screen.dart';
import 'package:fixly/features/customer/chat/ui/chat_screen/chat_screen.dart';
import 'package:fixly/features/customer/home/ui/home_screen.dart';
import 'package:fixly/features/customer/home/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:fixly/features/customer/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomerNavigationScreen extends StatefulWidget {
  const CustomerNavigationScreen({super.key});

  @override
  State<CustomerNavigationScreen> createState() =>
      _CustomerNavigationScreenState();
}

class _CustomerNavigationScreenState extends State<CustomerNavigationScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const MyBookingsScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: context.colors.surface,
        selectedItemColor: context.colors.accent,
        unselectedItemColor: context.colors.textSecondary,
      ),
    );
  }
}
