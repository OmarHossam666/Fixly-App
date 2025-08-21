import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/routing/models/router_choice.dart';
import 'package:fixly/features/who_are_you/ui/widgets/i_need_services_feature_items.dart';
import 'package:fixly/features/who_are_you/ui/widgets/i_provide_services_feature_items.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/authentication/ui/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoAreYouScreen extends StatefulWidget {
  final void Function(RouterChoice choice) onChooseRouter;
  const WhoAreYouScreen({super.key, required this.onChooseRouter});

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  RouterChoice routerChoice = RouterChoice.none;
  bool isTechnician = false;
  bool isCustomer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoWidget(),

                // Welcome title
                Text(
                  'Welcome to Fixly',
                  style: context.textStyles.bodyText,
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(25),

                // Subtitle
                Text(
                  'Who are you?',
                  style: context.textStyles.bodyTextBold.copyWith(
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(10),

                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    setState(() {
                      routerChoice = RouterChoice.customer;
                      isTechnician = false;
                      isCustomer = true;
                    });
                  },
                  child: SurfaceDark(
                    borderWidth: isCustomer ? 2.h : 1.h,
                    borderColor: isCustomer ? context.colors.accent : null,
                    borderColorAll: true,
                    borderRadiusAll: true,
                    allRadius: 10,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: context.colors.primary,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24.r,
                              ),
                            ),
                            horizontalSpacing(16),
                            Expanded(
                              child: Text(
                                'I need services',
                                style: context.textStyles.bodyTextBold.copyWith(
                                  fontSize: 20.sp,
                                  color: context.colors.facebook,
                                ),
                              ),
                            ),
                          ],
                        ),

                        verticalSpacing(16),

                        Text(
                          'Book trusted professionals for home repairs and maintenance',
                          style: context.textStyles.bodyTextSmall,
                        ),

                        verticalSpacing(20),

                        // Features grid
                        const INeedServicesFeatureItems(),
                      ],
                    ),
                  ),
                ),
                verticalSpacing(15),
                // "I provide services" card
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    setState(() {
                      routerChoice = RouterChoice.technician;
                      isTechnician = true;
                      isCustomer = false;
                    });
                  },
                  child: SurfaceDark(
                    borderColor: isTechnician ? context.colors.accent : null,
                    borderColorAll: true,
                    borderRadiusAll: true,
                    allRadius: 10,
                    borderWidth: isTechnician ? 2.h : 1.h,

                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: context.colors.accent,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Icon(
                                Icons.build,
                                color: context.colors.textOnAccent,
                                size: 24.r,
                              ),
                            ),
                            horizontalSpacing(16),
                            Expanded(
                              child: Text(
                                'I provide services',
                                style: context.textStyles.bodyTextBold.copyWith(
                                  fontSize: 20.sp,
                                  color: context.colors.accent,
                                ),
                              ),
                            ),
                          ],
                        ),

                        verticalSpacing(16),

                        Text(
                          'Join our network of skilled professionals and grow your business',
                          style: context.textStyles.bodyTextSmall,
                        ),

                        verticalSpacing(20),

                        // Features grid
                        const IProvideServicesFeatureItems(),
                      ],
                    ),
                  ),
                ),
                verticalSpacing(20),

                // Continue button
                SizedBox(
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (routerChoice != RouterChoice.none &&
                          context.mounted) {
                        widget.onChooseRouter(routerChoice);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: context.textStyles.bodyTextBold,
                        ),
                        horizontalSpacing(8),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ],
                    ),
                  ),
                ),

                verticalSpacing(24),

                // Bottom text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
