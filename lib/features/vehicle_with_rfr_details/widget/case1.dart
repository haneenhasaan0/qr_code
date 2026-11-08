import 'package:flutter/material.dart';

import '../../../core/app_colors/app_colors.dart';
import '../presentation/screens/vehicle_maintenance_screen.dart';

class Case1 extends StatelessWidget {
  const Case1({super.key});

  @override
  Widget build(BuildContext context) {
    void openMaintenanceScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VehicleMaintenanceScreen()),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              onTap: openMaintenanceScreen,
              child: Text(
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
  }
}
