import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/details/widgets/specifications_grid.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';
import '../../widget/case0.dart';
import '../../widget/case1.dart';
import '../widget/vehicle_header_card.dart';

class RfrVehicleScreen extends StatefulWidget {
  const RfrVehicleScreen({super.key,required this.plateNumber});
  final String plateNumber;

  @override
  State<RfrVehicleScreen> createState() => _RfrVehicleScreenState();
}

class _RfrVehicleScreenState extends State<RfrVehicleScreen> {
  int _selectedTabIndex = 0;

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Case0();


      case 1:
        return Case1();

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
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('تفاصيل العربية'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VehicleHeaderCard(colorCont:  AppColors.redColor.withValues(
                    alpha: 0.08,
                  ), text: "ليها بلاغ", colorText: AppColors.redColor),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                    SpecificationsGrid(plateNumber: widget.plateNumber,),
                  ),
                  VehicleTabBar(
                    hasRfr: true,
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
