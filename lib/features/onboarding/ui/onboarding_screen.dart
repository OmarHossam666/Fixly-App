import 'package:dots_indicator/dots_indicator.dart';
import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/onboarding/data/onboarding_data.dart';
import 'package:fixly/features/onboarding/ui/widgets/next_button.dart';
import 'package:fixly/features/onboarding/ui/widgets/onboarding_page_widget.dart';
import 'package:fixly/features/onboarding/ui/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_currentIndex < OnboardingDataList.onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _handleGetStarted();
    }
  }

  void _handleSkip() {
    context.pushReplacement(CustomerRoutes.authenticationScreen);
  }

  void _handleGetStarted() {
    context.pushReplacement(CustomerRoutes.authenticationScreen);
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
                itemCount: OnboardingDataList.onboardingItems.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    onboardingData: OnboardingDataList.onboardingItems[index],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: OnboardingDataList.onboardingItems.length,
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
                        OnboardingDataList.onboardingItems.length - 1,
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
