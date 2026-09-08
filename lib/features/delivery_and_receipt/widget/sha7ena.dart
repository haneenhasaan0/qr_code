import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class Sha7ena extends StatelessWidget {
  const Sha7ena({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.purpleColor),
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text("🚛  شاحنة",style: Theme.of(context).textTheme.bodyLarge),
            Spacer(),
            Icon(Icons.arrow_forward,color: AppColors.purpleColor,size: 12,)
          ],
        ),
      ),
    );
  }
}
