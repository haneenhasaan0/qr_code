import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/details/screens/vehicle_details_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_maintenance_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_trips_screen.dart';
import 'package:qr_code/features/login/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:qr_code/features/main/main_screen.dart';
import 'package:qr_code/features/month%20details/screen/moth_details_screen.dart';
import 'package:qr_code/features/scanning/screen/scan_screen.dart';

import '../../features/login/presentation/screen/login_screen.dart';

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
            create: (context)=>LoginCubit(),
            child: const LoginScreen()),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) {
          var userName=state.extra as String;
          return MainScreen(userName: userName,);}
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
