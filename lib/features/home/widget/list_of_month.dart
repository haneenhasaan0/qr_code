import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/home/widget/month.dart';

class ListOfMonth extends StatefulWidget {
  const ListOfMonth({super.key, required this.driverName});
  final String driverName;

  @override
  State<ListOfMonth> createState() => _ListOfMonthState();
}

class _ListOfMonthState extends State<ListOfMonth> with SingleTickerProviderStateMixin {
  final List<String> months = [
    'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
    'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر',
  ];

  // نبض مستمر للشهر الحالي
  late final AnimationController _pulse =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      // خلفية متدرجة هادية بدل الأبيض الصريح
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: isDark
              ? const [Color(0xFF0F172A), Color(0xFF1E1B4B)]
              : const [Color(0xFFEDE9FE), Color(0xFFE0F2FE), Color(0xFFFFF1E6)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 84,
          crossAxisCount: 2,
        ),
        itemCount: months.length,
        itemBuilder: (context, index) {
          final isCurrent = index == DateTime.now().month - 1;
          // دخول من الجنبين: الزوجي من ناحية والفردي من الناحية التانية
          Widget item = TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 500 + index * 80),
            curve: Curves.easeOutBack,
            builder: (_, v, child) => Opacity(
              opacity: v.clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset((index.isEven ? -1 : 1) * 70 * (1 - v), 0),
                child: child,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => context.push("/monthDetails", extra: {
                "driverName": widget.driverName,
                "month": months[index],
              }),
              child: Month(text: months[index], index: index, isCurrent: isCurrent),
            ),
          );
          if (isCurrent) {
            item = ScaleTransition(
              scale: Tween(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _pulse, curve: Curves.easeInOut)),
              child: item,
            );
          }
          return item;
        },
      ),
    );
  }
}
