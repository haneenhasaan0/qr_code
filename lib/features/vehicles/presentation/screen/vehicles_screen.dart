import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/details/widgets/preventative_maintenance_card.dart';
import 'package:qr_code/features/details/widgets/specifications_grid.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';
import 'package:qr_code/features/vehicle_details/presentation/screens/vehicle_maintenance_screen.dart';
import 'package:qr_code/features/vehicle_details/presentation/screens/vehicle_trips_screen.dart';
import 'package:qr_code/features/vehicle_details/widget/case1.dart';
import 'package:qr_code/features/vehicle_details/widget/case2/presentation/widget/case2.dart';

import '../../vehicle_details/presentation/widget/vehicle_header_card.dart';
import '../../vehicle_details/widget/case0.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key,required this.plateNumber});
  final String plateNumber;

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  int _selectedTabIndex = 0;



  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Case0();

      case 1:
        return Case1();
      case 2:
        return Case2();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeProvider.themeMode == ThemeMode.light
                ? AppColors.simpleBLueColor
                : AppColors.whiteColor,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'تفاصيل العربية',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VehicleHeaderCard(colorCont: AppColors.darkGreenColor, text: "شغالة", colorText: AppColors.greenColor),
                  VehicleTabBar(
                    hasRfr: false,
                    selectedIndex: _selectedTabIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildTabContent(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}