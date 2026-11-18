import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

/// شريط سفلي عايم: خلفية هادية، والتاب المختار حبة زرقا بتظهر اسمها.
class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (Icons.home_rounded, 'الرئيسية'),
    (Icons.qr_code_scanner, 'مسح الرمز'),
    (Icons.assignment_outlined, 'مأمورية'),
    (Icons.badge_outlined, 'الرخصة'),
    (Icons.gavel, 'قانون العمل'),
  ];

  static const _skyBlue = Color(0xFF38BDF8);
  static const _blue = Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.simpleBLueColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: _blue.withValues(alpha: 0.15)),
          boxShadow: [BoxShadow(color: _blue.withValues(alpha: 0.18), blurRadius: 20, offset: const Offset(0, 6))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < _items.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(horizontal: i == currentIndex ? 14 : 10, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: i == currentIndex ? const LinearGradient(colors: [_skyBlue, _blue]) : null,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: i == currentIndex ? 1.15 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(_items[i].$1, size: 24, color: i == currentIndex ? Colors.white : AppColors.borderColor),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        child: i == currentIndex
                            ? Padding(
                                padding: const EdgeInsetsDirectional.only(start: 6),
                                child: Text(_items[i].$2, style: AppStyles.bold.copyWith(fontSize: 12)),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
