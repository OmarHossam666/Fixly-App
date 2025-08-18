import 'package:fixly/core/routing/routers/technician_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixlyApp extends StatelessWidget {
  const FixlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: TechnicianRouter.router,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
