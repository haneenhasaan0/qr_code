import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';

class PreventativeMaintenanceCard extends StatelessWidget {
  const PreventativeMaintenanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.light
            ? AppColors.whiteColor
            : AppColors.simpleBLueColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الصيانة', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 12),
          // Last PM Row
          Row(
            children: [
              const Icon(Icons.history, size: 16, color: Color(0xFF64748B)),
              const SizedBox(width: 8),
              Text('اخر صيانة ', style: Theme.of(context).textTheme.bodyMedium),
              Text('2023-10-01', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 8),
          // Next PM Row
          Row(
            children: [
              Icon(
                Icons.event_outlined,
                size: 16,
                color: AppColors.lightGrayColor,
              ),
              const SizedBox(width: 8),
              Text(
                'الصيانة الجاية ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text('2023-10-01', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 14),
          // Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'حد الفاصل الزمني',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF64748B),
                  fontSize: 12,
                ),
              ),
              Text(
                '75%',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF64748B),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.75,
              color: themeProvider.themeMode == ThemeMode.light
                  ? AppColors.whiteColor
                  : AppColors.simpleBLueColor,
              minHeight: 6,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.purpleColor),
            ),
          ),
          const SizedBox(height: 10),
          // Current mileage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current: 50000',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Limit: 100000',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
