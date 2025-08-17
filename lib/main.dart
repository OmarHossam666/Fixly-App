import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.lightColors.background,
        body: Center(
          child: Text('Hello World!', style: AppStyles.light.bodyTextBold),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
