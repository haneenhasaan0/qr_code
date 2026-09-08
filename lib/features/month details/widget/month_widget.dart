import 'package:flutter/material.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/app_styles.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({super.key, required this.month});
  final String month;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 13,
            spreadRadius: 3,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: AppColors.simpleBLueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "كشف النقلات",
              style: AppStyles.semiBold.copyWith(fontSize: 8),
            ),
            SizedBox(height: 8),
            Text("$month 2026", style: AppStyles.bold),
          ],
        ),
      ),
    );
  }
}
