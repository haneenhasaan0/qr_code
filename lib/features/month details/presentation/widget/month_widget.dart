import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_styles/app_styles.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({super.key, required this.month});

  final String month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.purpleColor, const Color(0xFFEC4899)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: AppColors.purpleColor.withValues(alpha: 0.4), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("كشف النقلات", style: AppStyles.semiBold.copyWith(fontSize: 13, color: Colors.white70)),
                const SizedBox(height: 6),
                Text("$month ${DateTime.now().year}", style: AppStyles.bold.copyWith(fontSize: 26)),
              ],
            ),
          ),
          const Icon(Icons.calendar_month_rounded, size: 56, color: Colors.white38),
        ],
      ),
    );
  }
}
