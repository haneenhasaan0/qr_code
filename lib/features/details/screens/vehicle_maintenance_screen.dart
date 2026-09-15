import 'package:flutter/material.dart';
import 'package:qr_code/features/details/widgets/maintenance_history_item.dart';
import 'package:qr_code/features/details/widgets/preventative_maintenance_card.dart';
import 'package:qr_code/features/details/widgets/status_badge.dart';
import 'package:qr_code/features/details/widgets/vehicle_action_bar.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';

class VehicleMaintenanceScreen extends StatefulWidget {
  final int initialTabIndex;

  const VehicleMaintenanceScreen({super.key, this.initialTabIndex = 1});

  @override
  State<VehicleMaintenanceScreen> createState() =>
      _VehicleMaintenanceScreenState();
}

class _VehicleMaintenanceScreenState extends State<VehicleMaintenanceScreen> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
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
          if (index != 1) {
            Navigator.maybePop(context);
          }
        },
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 12);
            },
            itemBuilder: (BuildContext context, int index) {
              return PreventativeMaintenanceCard();
            },
          ),
        ),
      ),
    ]));
  }
}
