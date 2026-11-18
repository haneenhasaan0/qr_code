import 'package:flutter/material.dart';

import 'field_decoration.dart';

class MissionDropdown extends StatelessWidget {
  const MissionDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.labelOf,
    this.helperText,
    this.editIcon = false,
  });

  final String hint;
  final IconData icon;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  /// يغيّر النص المعروض لكل عنصر (القيمة نفسها بتفضل الاسم).
  final String Function(String item)? labelOf;

  /// سطر صغير تحت الحقل (مثلًا: "مربوطة بالسواق - اضغط للتغيير").
  final String? helperText;

  /// أيقونة تعديل بدل السهم عشان يبان إن القيمة قابلة للتغيير.
  final bool editIcon;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    String label(String e) => labelOf?.call(e) ?? e;
    return DropdownButtonFormField<String>(
      focusColor: Theme.of(context).focusColor,
      initialValue: value,
      isExpanded: true,
      style: style,
      icon: editIcon ? const Icon(Icons.edit_outlined, size: 20) : null,
      decoration: fieldDecoration(context, hint, icon)
          .copyWith(helperText: helperText),
      selectedItemBuilder: (_) => items
          .map((e) => Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(label(e), style: style, overflow: TextOverflow.ellipsis),
              ))
          .toList(),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(label(e), style: style)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
