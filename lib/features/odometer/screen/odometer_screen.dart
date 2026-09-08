import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/odometer/widget/odometer_details.dart';
import 'package:qr_code/features/odometer/widget/taking_photo_odometer.dart';

import '../../../core/app_styles/app_styles.dart';
import '../widget/odometr_widget.dart';

class OdometerScreen extends StatelessWidget {
  const OdometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OdometerWidget(),
            SizedBox(height: 20),
            OdometerDetails(),
            SizedBox(height: 20),
            TakingPhotoOdometer(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowColor,
              ),
              onPressed: () {
                // Handle submit button press
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'حفظ العداد 💾',
                  style: AppStyles.bold.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            InkWell(
              onTap: () {},
              child: Container(
                width:double.minPositive,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.yellowColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'عرض سجل كل العدادات ← 🗂',
                    textAlign: TextAlign.center,
                    style: AppStyles.bold.copyWith(
                      fontSize: 16,
                      color:AppColors.yellowColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
