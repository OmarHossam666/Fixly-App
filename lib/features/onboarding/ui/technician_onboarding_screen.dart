import 'package:dots_indicator/dots_indicator.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/routing/routes/technician_routes.dart';
import 'package:fixly/features/onboarding/data/technician_onboarding_data.dart';
import 'package:fixly/features/onboarding/ui/widgets/next_button.dart';
import 'package:fixly/features/onboarding/ui/widgets/onboarding_page_widget.dart';
import 'package:fixly/features/onboarding/ui/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TechnicianOnboardingScreen extends StatefulWidget {
  const TechnicianOnboardingScreen({super.key});

  @override
  State<TechnicianOnboardingScreen> createState() => _TechnicianOnboardingScreenState();
}

class _TechnicianOnboardingScreenState extends State<TechnicianOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_currentIndex < TechnicianOnboardingDataList.onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _handleGetStarted();
    }
  }

  void _handleSkip() {
    context.pushReplacement(TechnicianRoutes.authenticationScreen);
  }

  void _handleGetStarted() {
    context.pushReplacement(TechnicianRoutes.authenticationScreen);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: theme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SkipButton(onPressed: _handleSkip),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: TechnicianOnboardingDataList.onboardingItems.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    onboardingData: TechnicianOnboardingDataList.onboardingItems[index],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: TechnicianOnboardingDataList.onboardingItems.length,
                    position: _currentIndex.toDouble(),
                    animate: true,
                    decorator: DotsDecorator(
                      size: Size.square(9.w),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10.r),
                      ),
                      activeColor: context.colors.accent,
                      activeSize: Size(27.w, 9.h),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  NextButton(
                    onPressed: _handleNext,
                    isLastPage:
                        _currentIndex ==
                        TechnicianOnboardingDataList.onboardingItems.length - 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
