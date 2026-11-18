import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/main/main_screen.dart';
import 'package:qr_code/features/scanning/screen/scan_screen.dart';
import 'package:qr_code/features/splash_screen/presentation/cubit/splash_cubit.dart';
import 'package:qr_code/features/splash_screen/presentation/screen/splash_screen.dart';
import '../../features/casual_mission/presentation/cubit/casual_mission/casual_mission_cubit.dart';
import '../../features/casual_mission/presentation/screen/casual_mission.dart';
import '../../features/login/presentation/cubit/login/login_cubit/login_cubit.dart';
import '../../features/login/presentation/screen/login_screen.dart';
import '../../features/month details/presentation/screen/moth_details_screen.dart';
import '../../features/options/presentation/screen/Allowances_and_deductions_screen/presentation/sceen/Allowances_and_deductions_screen.dart';
import '../../features/options/presentation/screen/summary_salary_screen/screen/summary_salary_screen.dart';
import '../../features/options/presentation/screen/trips_monthly_screen/presentation/screen/trips_details_screen.dart';
import '../../features/vehicle_with_rfr_details/presentation/cubit/vehicle_details_cubit/vehicle_details_cubit.dart';
import '../../features/vehicle_with_rfr_details/presentation/screens/rfr_vehicle_screen.dart';
import '../../features/vehicle_with_rfr_details/presentation/screens/vehicle_trips_screen.dart';
import '../../features/vehicles/presentation/screen/vehicles_screen.dart';
import '../services/local/shared_pref.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/vehicle_details_response.dart';

class AppRoutes {
  static GoRouter get routes => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit()..getData(),
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;

          final user = SharedPref.getUser();

          final userName =
              data?['userName']?.toString() ?? user?.userName ?? '';
          return MainScreen(userName: userName);
        },
      ),
      GoRoute(
        path: '/scanning',
        builder: (context, state) {
          return ScanScreen();
        },
      ),
      GoRoute(
        path: '/rfr_details',
        builder: (context, state) {
          final plateNum = state.extra as String;

          return BlocProvider(
            create: (context) =>
                VehicleDetailsCubit()..getVehicleDetails(plateNum),
            child: RfrVehicleScreen(plateNumber: plateNum),
          );
        },
      ),
      GoRoute(
        path: '/vehicle_screen',
        builder: (context, state) {
          final vehicle = state.extra as Datum;

          return BlocProvider(
            create: (context) =>
                VehicleDetailsCubit()..getVehicleDetails(vehicle.licensePlate),
            child: VehiclesScreen(vehicle: vehicle),
          );
        },
      ),

      GoRoute(
        path: '/monthDetails',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final driverName = extra['driverName'].toString();
          final month = extra['month'].toString();
          return MonthDetailsScreen(month: month, driverName: driverName);
        },
      ),
      GoRoute(
        path: '/vehicle_trips',
        builder: (context, state) => const VehicleTripsScreen(),
      ),

      GoRoute(
        path: '/summary_salary',
        builder: (context, state) => const SummarySalaryScreen(),
      ),
      GoRoute(
        path: '/trips_details',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return TripsDetailsScreen(
            start: extra['start'],
            end: extra['end'],
            driverName: extra['driverName'],
          );
        },
      ),
      GoRoute(
        path: '/allowances_deductions',
        builder: (context, state) => const AllowancesAndDeductionsScreen(),
      ),
    ],
  );
}
