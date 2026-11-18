import 'package:flutter/material.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.text1,
    required this.text2,
    this.iconColor,
  });

  final Color color;
  final Color? iconColor;
  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, Color.lerp(color, Colors.black, 0.35)!],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 14, offset: const Offset(0, 6))],
      ),
      child: Stack(
        children: [
          // أيقونة كبيرة باهتة للزينة
          Positioned(
            left: -10,
            bottom: -10,
            child: Icon(icon, size: 72, color: Colors.white.withValues(alpha: 0.15)),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), shape: BoxShape.circle),
                      child: Icon(icon, color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(text1, style: AppStyles.semiBold.copyWith(fontSize: 12))),
                  ],
                ),
                const SizedBox(height: 14),
                Text(text2, style: AppStyles.bold.copyWith(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
