import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/authentication/ui/authentication_screen.dart';
import 'package:fixly/features/main/ui/main_screen.dart';
import 'package:fixly/features/onboarding/ui/onboarding_screen.dart';
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
    ],
  );
}
