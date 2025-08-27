import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/core/widgets/theme_toggle_button.dart';
import 'package:fixly/features/customer/home/data/services.dart';
import 'package:fixly/features/customer/home/models/service.dart';
import 'package:fixly/features/customer/home/ui/widgets/custom_search_bar.dart';
import 'package:fixly/features/customer/home/ui/widgets/fixly_flash_card.dart';
import 'package:fixly/features/customer/home/ui/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  int currentBottomNavIndex = 0;

  final String userName = 'Omar';

  void _handleServicePress(Service service) {
    _showServiceDialog(service);
  }

  void _handleFixlyFlash() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.colors.surface,
          title: Text('⚡ Fixly Flash', style: context.textStyles.headline),
          content: Text(
            'Emergency technician will arrive within 60 minutes. Continue?',
            style: context.textStyles.bodyText,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Cancel', style: context.textStyles.primaryButton),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
                // Navigate to flash booking screen
                _showBookingConfirmation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primaryButton,
                foregroundColor: context.colors.primaryButtonText,
              ),
              child: Text('Book Now', style: context.textStyles.primaryButton),
            ),
          ],
        );
      },
    );
  }

  void _showServiceDialog(Service service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.colors.surfaceSecondary,
          title: Text(service.name, style: context.textStyles.headline),
          content: Text(
            'You selected ${service.name}. ${service.description}',
            style: context.textStyles.bodyText,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Close', style: context.textStyles.primaryButton),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
                context.push(CustomerRoutes.serviceDetailsScreen, extra: service);
                // Navigate to service booking
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: service.color,
                foregroundColor: context.colors.primaryButtonText,
              ),
              child: Text(
                'Book Service',
                style: context.textStyles.primaryButton,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showBookingConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: Border.all(color: context.colors.border, width: 2.w),
        elevation: 10,
        content: Text(
          'Flash booking initiated! Technician on the way.',
          style: context.textStyles.bodyTextBold.copyWith(
            color: context.colors.textOnAccent,
          ),
        ),
        backgroundColor: context.colors.accent,
      ),
    );
  }

  void _handleSearch() {
    if (searchQuery.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Searching for: ${searchQuery.trim()}',
            style: context.textStyles.bodyTextBold,
          ),
          backgroundColor: context.colors.accent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: CustomScrollView(
        slivers: [
          // Header with Welcome & Logo
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.settings,
                                size: 20.sp,
                                color: context.colors.background,
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              right: 1,
                              child: Container(
                                width: 12.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: context.colors.accent,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Icon(
                                  Icons.bolt,
                                  size: 6.sp,
                                  color: context.colors.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fixly', style: context.textStyles.headline),
                          Text(
                            'صلّحلي',
                            style: context.textStyles.logoSubtitle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const ThemeToggleSwitch(),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Personal Welcome
                  Text('Hello, $userName!', style: context.textStyles.headline),
                  SizedBox(height: 4.h),
                  Text(
                    'What can we fix for you today?',
                    style: context.textStyles.bodyText,
                  ),
                ],
              ),
            ),
          ),

          // Search Bar
          SliverToBoxAdapter(
            child: CustomSearchBar(
              searchQuery: searchQuery,
              onChanged: (value) => setState(() => searchQuery = value),
              onSearch: _handleSearch,
              backgroundColor: context.colors.surface,
              borderColor: context.colors.border,
              textColor: context.colors.text,
              hintColor: context.colors.textSecondary,
            ),
          ),

          // Fixly Flash Banner
          SliverToBoxAdapter(
            child: FixlyFlashCard(
              onTap: _handleFixlyFlash,
              accentColor: context.colors.accent,
              backgroundColor: context.colors.background,
            ),
          ),

          // Popular Services Header
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Our Most Popular Services',
                style: context.textStyles.sectionHeader,
              ),
            ),
          ),

          // Services Grid
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final service = ServiceData.popularServices[index];
                return ServiceCard(
                  service: service,
                  onTap: () => _handleServicePress(service),
                  surfaceColor: context.colors.surface,
                  borderColor: context.colors.border,
                  textColor: context.colors.text,
                  textSecondaryColor: context.colors.textSecondary,
                  backgroundColor: context.colors.background,
                );
              }, childCount: ServiceData.popularServices.length),
            ),
          ),
        ],
      ),
    );
  }
}
