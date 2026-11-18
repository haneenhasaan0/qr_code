
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/app_colors.dart';

class RfrDetails extends StatefulWidget {
  const RfrDetails({
    super.key,
    required this.type,
    required this.items,
    required this.onChanged,
  });

  final String type;
  final List<dynamic> items;
  final ValueChanged<int?> onChanged;

  @override
  State<RfrDetails> createState() => _RfrDetailsState();
}

class _RfrDetailsState extends State<RfrDetails> {
  int? selectedId;
  int? selectedRfrListId;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: selectedId,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: widget.type,
        filled: true,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        fillColor: Theme.of(context).focusColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'من فضلك اختار ${widget.type}';
        }
        return null;
      },
      hint: Text(
        'اختار العنصر',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      style: Theme.of(context)
          .textTheme
          .bodyLarge,
      dropdownColor: Theme.of(context).focusColor,
      borderRadius: BorderRadius.circular(12),
      menuMaxHeight: 200,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      items: widget.items.map((item) {
        return DropdownMenuItem<int>(
          value: item.id as int,
          child: Text(
            item.name as String,
            overflow: TextOverflow.ellipsis,
            style:Theme.of(context)
                .textTheme
                .bodyLarge,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedId = value;
          selectedRfrListId = value;
        });
        widget.onChanged.call(value);
      },
    );
  }
}