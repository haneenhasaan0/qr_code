import 'package:flutter/material.dart';

import '../../../core/app_colors/app_colors.dart';
import '../presentation/screens/vehicle_trips_screen.dart';

class Case0 extends StatelessWidget {
  const Case0({super.key});

  @override
  Widget build(BuildContext context) {
    void openTripsScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VehicleTripsScreen()),
      );
    }
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: openTripsScreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: AppColors.purpleColor,
                ),
                Text(
                  'عرض كل الرحلات',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: AppColors.purpleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
