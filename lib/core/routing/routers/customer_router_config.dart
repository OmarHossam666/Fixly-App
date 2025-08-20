import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/authentication/ui/authentication_screen.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/booking_confirmation_screen.dart';
import 'package:fixly/features/customer/main/ui/main_screen.dart';
import 'package:fixly/features/customer/onboarding/ui/onboarding_screen.dart';
import 'package:fixly/features/customer/review_booking_details/ui/review_booking_details_screen.dart';
import 'package:fixly/features/customer/technician_profile/ui/technician_profile_screen.dart';
import 'package:go_router/go_router.dart';

class CustomerRouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: CustomerRoutes.onboardingScreen,
    routes: [
      GoRoute(
        name: CustomerRoutes.onboardingScreen.substring(1),
        path: CustomerRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: CustomerRoutes.authenticationScreen,
        name: CustomerRoutes.authenticationScreen.substring(1),
        builder: (context, state) => const AuthenticationScreen(),
      ),
      GoRoute(
        path: CustomerRoutes.mainScreen,
        name: CustomerRoutes.mainScreen.substring(1),
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: CustomerRoutes.technicianProfileScreen,
        name: CustomerRoutes.technicianProfileScreen.substring(1),
        builder: (context, state) => const TechnicianProfileScreen(),
      ),
      GoRoute(
        path: CustomerRoutes.reviewBookingDetailsScreen,
        name: CustomerRoutes.reviewBookingDetailsScreen.substring(1),
        builder: (context, state) => const ReviewBookingDetailsScreen(),
      ),
      GoRoute(
        path: CustomerRoutes.bookingConfirmationScreen,
        name: CustomerRoutes.bookingConfirmationScreen.substring(1),
        builder: (context, state) => const BookingConfirmationScreen(),
      ),
    ],
  );
}
