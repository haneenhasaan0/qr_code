import 'package:flutter/material.dart';
import 'package:qr_code/features/details/widgets/status_badge.dart';
import 'package:qr_code/features/details/widgets/trip_card.dart';
import 'package:qr_code/features/details/widgets/vehicle_action_bar.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';

class VehicleTripsScreen extends StatefulWidget {
  final int initialTabIndex;

  const VehicleTripsScreen({super.key, this.initialTabIndex = 0});

  @override
  State<VehicleTripsScreen> createState() => _VehicleTripsScreenState();
}

class _VehicleTripsScreenState extends State<VehicleTripsScreen> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "ABC-1234",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                StatusBadge(
                  text: "شغالة",
                  backgroundColor: const Color(0xFFDCFCE7),
                  textColor: const Color(0xFF15803D),
                  fontSize: 10,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'VH-00217 • Volvo FH16',
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          VehicleTabBar(
            selectedIndex: _selectedTab,
            onTabSelected: (index) {
              setState(() {
                _selectedTab = index;
              });
              if (index != 0) {
                // Return to main details or switch
                Navigator.maybePop(context);
              }
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },

              itemBuilder: (context, index) {
                return Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'كل الرحلات',
                      style: TextStyle(
                        color: Color(0xFF0D9488),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // const VehicleActionBar(),
    );
  }
}
