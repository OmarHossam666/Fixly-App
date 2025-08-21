import 'package:fixly/core/constants/app_theme.dart';
import 'package:fixly/core/routing/models/router_choice.dart';
import 'package:fixly/core/routing/routers/customer_router_config.dart';
import 'package:fixly/core/routing/routers/technician_router_config.dart';
import 'package:fixly/features/who_are_you/ui/who_are_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FixlyApp extends StatefulWidget {
  const FixlyApp({super.key});

  @override
  State<FixlyApp> createState() => _FixlyAppState();
}

class _FixlyAppState extends State<FixlyApp> {
  GoRouter? selectedRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        if (selectedRouter == null) {
          
          // ✅ No router chosen yet → show who are you screen
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.dark,
            home: WhoAreYouScreen(
              onChooseRouter: (choice) {
                setState(() {
                  selectedRouter = choice == RouterChoice.customer
                      ? CustomerRouterConfig.router
                      : choice == RouterChoice.technician
                      ? TechnicianRouterConfig.router
                      : null;
                });
              },
            ),
          );
        }

        // ✅ Router chosen → load router app
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.dark,
          routerConfig: selectedRouter!,
        );
      },
    );
  }
}
