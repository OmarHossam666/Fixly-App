import 'package:fixly/core/routing/routes/technician_routes.dart';
import 'package:fixly/features/technician/earnings/ui/technician_earnings_screen.dart';
import 'package:fixly/features/technician/home/ui/technician_home_screen.dart';
import 'package:fixly/features/technician/jobs/ui/technician_jobs_screen.dart';
import 'package:fixly/features/technician/profile/ui/technician_profile_screen.dart';
import 'package:fixly/features/technician/technician_navigation_screen.dart';
import 'package:go_router/go_router.dart';

class TechnicianRouter {
  static GoRouter router = GoRouter(
    initialLocation: TechnicianRoutes.navigationScreen,
    routes: [
      GoRoute(
        path: TechnicianRoutes.navigationScreen,
        builder: (context, state) => const TechnicianNavigationScreen(),
      ),

      GoRoute(
        path: TechnicianRoutes.homeScreen,
        builder: (context, state) => const TechnicianHomeScreen(),
      ),
      GoRoute(
        path: TechnicianRoutes.jobsScreen,
        builder: (context, state) => const TechnicianJobScreen(),
      ),
      GoRoute(
        path: TechnicianRoutes.earningsScreen,
        builder: (context, state) => const TechnicianEarningsScreen(),
      ),
      GoRoute(
        path: TechnicianRoutes.profileScreenPage,
        builder: (context, state) => const TechnicianProfileScreenPage(),
      ),
    ],
  );
}
