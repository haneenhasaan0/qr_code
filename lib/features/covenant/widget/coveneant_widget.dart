import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/delivery_and_receipt/widget/sha7ena.dart';
import 'package:qr_code/features/delivery_and_receipt/widget/wensh.dart';

class CovenantWidget extends StatelessWidget {
  const CovenantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text("💸", style: TextStyle(fontSize: 24)),
            SizedBox(height: 32),
            Text("عجز العهدة",  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24)),
            SizedBox(height: 4),
            Text(
              "ده كشف بعجز العهدة المسجّل عليك — اضغط (بالعلم)\n  لتأكيد اطّلاعك على كل بند",
              style: AppStyles.semiBold.copyWith(fontSize: 12,color: AppColors.lightGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
