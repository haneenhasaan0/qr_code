import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../casual_mission/presentation/screen/casual_mission.dart';
import '../home/screen/months_screen.dart';
import '../licence/presentation/screen/licence_screen.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_cubit/user_name_cubit.dart';
import '../login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';
import '../labor_law/screen/labor_law_screen.dart';
import 'app_bottom_bar.dart';
import '../scanning/screen/scan_screen.dart';
import '../welcome/presentation/widget/welcome_gate.dart';

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

            print('USERNAME = "${widget.userName}"');
            print('DRIVER NAME = "$driverName"');

            final screens = [
              HomeScreen(userName: widget.userName, driverName: driverName),
              ScanScreen(),
              MissionsScreen(code: widget.userName,),
              LicenceScreen(id:widget.userName ),
              const LaborLawScreen(),
            ];

            return WelcomeGate(
              employeeNo: widget.userName,
              driverName: driverName,
              child: Scaffold(
              body: screens[currIndex],

              bottomNavigationBar: AppBottomBar(
                currentIndex: currIndex,
                onTap: (index) => setState(() => currIndex = index),
              ),
            ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
