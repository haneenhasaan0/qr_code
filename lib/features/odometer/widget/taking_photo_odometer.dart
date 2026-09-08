import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/nakalty/widget/camera.dart';
import 'package:qr_code/features/nakalty/widget/upload_photo.dart';

class TakingPhotoOdometer extends StatelessWidget {
  const TakingPhotoOdometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.simpleBLueColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "📷 صوّر العداد (اختياري)",
              style: AppStyles.bold.copyWith(
                color: AppColors.yellowColor,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: CameraWidget()),
                SizedBox(width: 8,),
                Expanded(child: UploadPhotoWidget())
              ],
            )
          ],
        ),
      ),
    );
  }
}
