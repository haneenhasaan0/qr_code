import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/details/widgets/vehicle_tab_bar.dart';
import '../../../vehicle_with_rfr_details/presentation/widget/vehicle_header_card.dart';
import '../../../vehicle_with_rfr_details/widget/case0.dart';
import '../../../vehicle_with_rfr_details/widget/case1.dart';
import '../widget/case2/case2.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/vehicle_details_response.dart';
class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key,required this.vehicle});
  final Datum vehicle;

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
        return Case2(
          vehicle: widget.vehicle,
        );
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