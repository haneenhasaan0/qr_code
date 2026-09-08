import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

class VehicleTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final List<String> tabs;

  const VehicleTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.tabs = const ['الرحلات', 'الصيانة'],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? AppColors.purpleColor : Colors.transparent,
                      width: 2.5,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style:Theme.of(context).textTheme.bodyMedium?.copyWith(color:
                      isSelected ?
                      AppColors.purpleColor:
                      const Color(0xFF64748B),
                      fontSize: 14
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
