import 'package:fixly/core/routing/routes/technician_routes.dart';
import 'package:fixly/features/technician/home/ui/technician_home_screen.dart';
import 'package:go_router/go_router.dart';

class TechnicianRouter {
  static GoRouter router = GoRouter(
  initialLocation: TechnicianRoutes.homeScreen,
    routes: [
      GoRoute(
        path: TechnicianRoutes.homeScreen,
        builder: (context, state) => const TechnicianHomeScreen(),
      )
    ]
    );
}