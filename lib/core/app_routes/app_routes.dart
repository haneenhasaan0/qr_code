import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/details/screens/vehicle_details_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_maintenance_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_trips_screen.dart';
import 'package:qr_code/features/main/main_screen.dart';
import 'package:qr_code/features/scanning/screen/scan_screen.dart';

import '../../features/login/presentation/cubit/login/login_cubit/login_cubit.dart';
import '../../features/login/presentation/screen/login_screen.dart';
import '../../features/month details/presentation/screen/moth_details_screen.dart';

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final userName = extra['userName'] as String;

          return MainScreen(
            driverName: userName,
            userName: userName, // هنجيب اسم السائق من API
          );
        },
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
          final extra = state.extra as Map<String, dynamic>;
          final driverName = extra['driverName'] as String;
          final month = extra['month'] as String;
          return MonthDetailsScreen(month: month,driverName: driverName);
        },
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