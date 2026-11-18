import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  const Month({super.key, required this.text, required this.index, this.isCurrent = false});
  final String text;
  final int index; // 0 = يناير
  final bool isCurrent;

  // لون كل فصل: شتا، ربيع، صيف، خريف
  static const _seasons = [Color(0xFF0EA5E9), Color(0xFF10B981), Color(0xFFF59E0B), Color(0xFFEF4444)];

  @override
  Widget build(BuildContext context) {
    final color = _seasons[((index + 1) % 12) ~/ 3];
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      elevation: isCurrent ? 8 : 3,
      shadowColor: color.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withValues(alpha: isCurrent ? 0.45 : 0.25), color.withValues(alpha: 0.06)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          color: theme.focusColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: isCurrent ? 1 : 0.5), width: isCurrent ? 2 : 1.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: color,
                child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyLarge),
                    if (isCurrent)
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
                        child: const Text('الشهر الحالي', style: TextStyle(color: Colors.white, fontSize: 9)),
                      ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
