import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class OdometerWidget extends StatelessWidget {
  const OdometerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.simpleBLueColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2", style: AppStyles.bold.copyWith(fontSize: 10)),
                      SizedBox(width: 4),
                      Text("1", style: AppStyles.bold.copyWith(fontSize: 10)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4", style: AppStyles.bold.copyWith(fontSize: 10)),
                      SizedBox(width: 4),
                      Text("3", style: AppStyles.bold.copyWith(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text('تسجيل العداد', style: AppStyles.bold),
            SizedBox(height: 8),
            Text(
              'اختار العربية وسجل العداد أو صوّره',
              style: AppStyles.bold.copyWith(color: AppColors.lightGrayColor,fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
