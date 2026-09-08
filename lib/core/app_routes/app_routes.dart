import 'package:go_router/go_router.dart';
import 'package:qr_code/features/details/screens/vehicle_details_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_maintenance_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_trips_screen.dart';
import 'package:qr_code/features/login/screen/login_screen.dart';
import 'package:qr_code/features/main/main_screen.dart';
import 'package:qr_code/features/month%20details/screen/moth_details_screen.dart';
import 'package:qr_code/features/scanning/screen/scan_screen.dart';

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: '/scanning',
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: '/monthDetails',
        builder: (context, state) {
          final String month=state.extra as String;
          return MonthDetailsScreen(month: month);}
      ),
      GoRoute(
        path: '/vehicle_trips',
        builder: (context, state) => const VehicleTripsScreen(),
      ),
      GoRoute(
        path: '/vehicle_maintenance',
        builder: (context, state) => const VehicleMaintenanceScreen(),
      ),
    ],
  );
}
