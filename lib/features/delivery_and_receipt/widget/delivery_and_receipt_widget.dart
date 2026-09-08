import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/delivery_and_receipt/widget/sha7ena.dart';
import 'package:qr_code/features/delivery_and_receipt/widget/wensh.dart';

class DeliveryAndReceiptWidget extends StatelessWidget {
  const DeliveryAndReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.greenColor.withOpacity(0.1),
            AppColors.purpleColor.withOpacity(0.1),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("🤝", style: TextStyle(fontSize: 24)),
            SizedBox(height: 32),
            Text("تسليم وتسلم", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24)),
            SizedBox(height: 4),
            Text(
              " اختار نوع المركبة وسجّل استمارة التسليم والتسلم",
              style: AppStyles.semiBold.copyWith(fontSize: 12,color: AppColors.lightGrayColor),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Sha7ena()),
                SizedBox(width: 12,),
                Expanded(child: Wensh())
              ],
            )
          ],
        ),
      ),
    );
  }
}
