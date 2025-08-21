import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/routing/models/router_choice.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/core/who_are_you_screen/ui/widgets/feature_item.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/logo_widget.dart';
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
                // Container(
                //   width: 80.w,
                //   height: 80.h,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [
                //         context.colors.primary.withAlpha(140),
                //         context.colors.accent.withAlpha(140),
                //       ],
                //     ),
                //     borderRadius: BorderRadius.circular(40.r),
                //   ),
                //   child: Icon(
                //     Icons.build_rounded,
                //     color: Colors.white,
                //     size: 40.r,
                //   ),

                // ),
                const LogoWidget(),

                // Welcome title
                Text(
                  'Welcome to Fixly',
                  style: context.textStyles.bodyText,
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(30),

                // Subtitle
                Text(
                  'Who are you?',
                  style: context.textStyles.bodyTextBold.copyWith(
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(20),

                // "I need services" card
                InkWell(
                  splashColor: Colors.transparent, // remove ripple
                  highlightColor: Colors.transparent, // remove press color
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,

                  onTap: () {
                    setState(() {
                      routerChoice = RouterChoice.customer;
                    });
                  },

                  child: SurfaceDark(
                    borderColorAll: true,
                    borderRadiusAll: true,
                    allRadius: 16,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 24),
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.verified,
                                    text: 'Verified Technicians',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.security,
                                    text: 'Secure Payments',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpacing(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.track_changes,
                                    text: 'Real-time Tracking',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.verified_user,
                                    text: 'Quality Guarantee',
                                    context: context,
                                    color: context.colors.facebook,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // "I provide services" card
                InkWell(
                  splashColor: Colors.transparent, // remove ripple
                  highlightColor: Colors.transparent, // remove press color
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    setState(() {
                      routerChoice = RouterChoice.technician;
                    });
                  },
                  child: SurfaceDark(
                    borderColorAll: true,
                    borderRadiusAll: true,
                    allRadius: 16,
                    padding: EdgeInsets.all(20.r),
                    margin: EdgeInsets.only(bottom: 48.h),
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.schedule,
                                    text: 'Flexible scheduling',
                                    context: context,
                                    color: context.colors.accent,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.star_rate,
                                    text: 'Customer reviews',
                                    color: context.colors.accent,
                                    context: context,
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpacing(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureItem(
                                    icon: Icons.flash_on,
                                    text: 'Instant payments',
                                    context: context,
                                    color: context.colors.accent,
                                  ),
                                  verticalSpacing(12),
                                  FeatureItem(
                                    icon: Icons.business_center,
                                    text: 'Business tools',
                                    context: context,
                                    color: context.colors.accent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
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
