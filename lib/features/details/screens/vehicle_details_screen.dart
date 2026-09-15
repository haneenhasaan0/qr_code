import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/details/screens/vehicle_maintenance_screen.dart';
import 'package:qr_code/features/details/screens/vehicle_trips_screen.dart';
import 'package:qr_code/features/details/widgets/maintenance_history_item.dart';
import 'package:qr_code/features/details/widgets/preventative_maintenance_card.dart';
import 'package:qr_code/features/details/widgets/specifications_grid.dart';
import 'package:qr_code/features/details/widgets/vehicle_action_bar.dart';
import 'package:qr_code/features/details/widgets/vehicle_header_card.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';

class DetailsScreen extends StatefulWidget {

  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTabIndex = 0;


  void _openTripsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleTripsScreen(),
      ),
    );
  }

  void _openMaintenanceScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleMaintenanceScreen(),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        // Trips Tab - Shows Preview with Option to View All
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: _openTripsScreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.purpleColor),
                    Text(
                        'عرض كل الرحلات',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14,color: AppColors.purpleColor)
                    ),
                  ],
                ),

              ),
            ),
          ],
        );

      case 1:
        // Maintenance Tab - Shows PM Card & History Preview
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreventativeMaintenanceCard(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'تفاصيل الصيانة',
                  style: TextStyle(
                    color: Color(0xFF475569),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                InkWell(
                  onTap: _openMaintenanceScreen,
                  child:  Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: AppColors.purpleColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: themeProvider.themeMode==ThemeMode.light?AppColors.simpleBLueColor:AppColors.whiteColor,),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'تفاصيل العربية',
          style: Theme.of(context).textTheme.bodyLarge
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
                  // Vehicle Header Card
                  VehicleHeaderCard(),

                  // Specifications Grid
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SpecificationsGrid(),
                  ),

                  // Tabs: Trips, Maintenance, Odometer
                  VehicleTabBar(
                    selectedIndex: _selectedTabIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                  ),

                  // Active Tab Content
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
