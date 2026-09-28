import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/features/home/screen/months_screen.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_cubit/user_name_cubit.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';
import '../notifications/screen/notification.dart';
import '../profile/screen/profile_screen.dart';
import '../scanning/screen/scan_screen.dart';
import '../vehicles/screen/vehicles_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.userName,
    required this.driverName,
  });

  final String driverName;
  final String userName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currIndex = 0;
  late List<Widget> screens = [
    HomeScreen(driverName: widget.driverName, userName: widget.userName),
    const NotificationScreen(),
    const ScanScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.userName);
    return BlocProvider(
      create: (context) => UserNameCubit()..getDriverName(widget.userName),

      child: BlocBuilder<UserNameCubit, UserNameState>(
        builder: (context, state) {
          if (state is UserNameLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is UserNameFail) {
            return Scaffold(body: Center(child: Text(state.msg)));
          }

          if (state is UserNameSuccess) {
            final driverName = state.name;

            final screens = [
              HomeScreen(userName: widget.userName, driverName: driverName),
              ScanScreen(),
              NotificationScreen(),
              ProfileScreen()
            ];
            return Scaffold(
              body: screens[currIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currIndex,
                onTap: (index) {
                  setState(() {
                    currIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    label: 'الشهور',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.not_listed_location_outlined),
                    label: 'الاشعارات',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code),
                    label: 'مسح رمز العربية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'الحساب',
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
