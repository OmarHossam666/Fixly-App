import 'package:fixly/core/routing/routes/technician_routes.dart';
import 'package:fixly/features/technician/home/ui/technician_home_screen.dart';
import 'package:fixly/features/technician/jobs/ui/technician_jobs_screen.dart';
import 'package:go_router/go_router.dart';

class TechnicianRouter {
  static GoRouter router = GoRouter(
    initialLocation: TechnicianRoutes.homeScreen,
    routes: [
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
        builder: (context, state) => const TechnicianHomeScreen(),
      ),
      GoRoute(
        path: TechnicianRoutes.profileScreen,
        builder: (context, state) => const TechnicianHomeScreen(),
      ),
    ],
  );
}
