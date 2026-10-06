import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/licence/screen/profile_screen.dart';

import '../home/screen/months_screen.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_cubit/user_name_cubit.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';
import '../notifications/screen/notification.dart';
import '../scanning/screen/scan_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.userName});

  final String userName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('USERNAME = "${widget.userName}"');

    return BlocProvider(
      create: (context) => UserNameCubit()..getDriverName(widget.userName),

      child: BlocBuilder<UserNameCubit, UserNameState>(
        builder: (context, state) {
          // Loading
          if (state is UserNameLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Error
          if (state is UserNameFail) {
            return Scaffold(body: Center(child: Text(state.msg)));
          }

          // Success
          if (state is UserNameSuccess) {
            // اسم السواق الحقيقي القادم من API
            final driverName = state.name;

            print('USERNAME = "${widget.userName}"');
            print('DRIVER NAME = "$driverName"');
            final screens = [
              HomeScreen(userName: widget.userName, driverName: driverName),
              const ScanScreen(),
              const NotificationScreen(),
              const LicenceScreen(),
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

                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    label: 'الشهور',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code),
                    label: 'مسح رمز العربية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_outlined),
                    label: 'الاشعارات',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_police_outlined),
                    label: 'الرخصة',
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
