import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/nakalty/widget/camera.dart';
import 'package:qr_code/features/nakalty/widget/upload_polisa.dart';

import '../../../core/app_styles/app_styles.dart';
import '../widget/upload_photo.dart';

class NakaltyScreen extends StatelessWidget {
  const NakaltyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(24),
      child: Column(children: [
        UploadPolisa(),
        SizedBox(height: 12),
        Text("صورة البوليصة", style: AppStyles.bold.copyWith(color: AppColors.purpleColor, fontSize: 16)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: CameraWidget()),
            SizedBox(width: 8,),
            Expanded(child: UploadPhotoWidget()),
          ],
        )
      ]),
    );
  }
}
