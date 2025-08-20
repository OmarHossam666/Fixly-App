import 'package:fixly/core/constants/app_theme.dart';
import 'package:fixly/core/routing/routers/customer_router_config.dart';
import 'package:fixly/core/routing/routers/technician_router.dart';
import 'package:fixly/features/onboarding/ui/who_are_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixlyApp extends StatelessWidget {
  const FixlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.dark,
          home: const WhoAreYouScreen(),
        );
      },
    );
  }
}
