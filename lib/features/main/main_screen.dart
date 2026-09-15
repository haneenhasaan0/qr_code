import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/features/home/screen/months_screen.dart';
import '../notifications/screen/notification.dart';
import '../profile/screen/profile_screen.dart';
import '../scanning/screen/scan_screen.dart';
import '../vehicles/screen/vehicles_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key,required this.userName});
  final String userName;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currIndex = 0;
  late List<Widget> screens = [
    HomeScreen(userName: widget.userName,),
    const NotificationScreen(),
    const ScanScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.userName);
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
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'مسح رمز العربية'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الحساب'),
        ],
      ),
    );
  }
}
