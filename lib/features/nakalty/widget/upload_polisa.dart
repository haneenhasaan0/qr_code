import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class UploadPolisa extends StatelessWidget {
  const UploadPolisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkPurpleColor,
                border: Border.all(color: AppColors.purpleColor),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(12),
                child: Icon(Icons.upload_file, color: Colors.white, size: 24),
              ),
            ),
            SizedBox(height: 20),
            Text("صوّر بوليصة النقلة",style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 12),
            Text("صوّر البوليصة وهيملي البيانات تلقائياً",style: AppStyles.semiBold.copyWith(color: AppColors.lightGrayColor),),
          ],
        ),
      ),
    );
  }
}
