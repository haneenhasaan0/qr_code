import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.icon, required this.color

});

final String title;
final IconData icon;
final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 9),
        Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).cardColor)
        ),
      ],
    );
  }
  }

