import 'package:flutter/material.dart';

import 'field_decoration.dart';

class MissionDateField extends StatelessWidget {
  const MissionDateField({
    super.key,
    required this.date,
    required this.onChanged,
    this.label = 'التاريخ',
    this.firstDate,
  });

  final DateTime date;
  final ValueChanged<DateTime> onChanged;
  final String label;

  /// أقدم تاريخ مسموح (مثلًا: النهاية ماتبقاش قبل البداية).
  final DateTime? firstDate;

  @override
  Widget build(BuildContext context) {
    final first = firstDate ?? DateTime(2020);
    return InkWell(
      onTap: () async {
        final d = await showDatePicker(
          context: context,
          initialDate: date.isBefore(first) ? first : date,
          firstDate: first,
          lastDate: DateTime(2100),
        );
        if (d != null) onChanged(d);
      },
      child: InputDecorator(
        decoration: fieldDecoration(context, label, Icons.calendar_month_outlined)
            .copyWith(labelText: label, hintText: null),
        child: Text('${date.day}/${date.month}/${date.year}', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
