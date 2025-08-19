import 'package:fixly/features/booking_confirmation/ui/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Demo app to test the BookingConfirmationScreen
class BookingConfirmationDemo extends StatelessWidget {
  const BookingConfirmationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.light),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.light,
          home: const BookingConfirmationScreen(
            bookingId: 'FX12345',
            technicianName: 'Hassan Mahmoud',
            serviceName: 'Plumbing',
          ),
        );
      },
    );
  }
}

void main() {
  runApp(const BookingConfirmationDemo());
}
