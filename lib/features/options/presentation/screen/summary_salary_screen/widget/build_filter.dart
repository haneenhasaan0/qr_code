import 'package:flutter/material.dart';

import '../../../../../../core/app_colors/app_colors.dart';

class BuildFilter extends StatelessWidget {
  const BuildFilter({super.key,
    required this.label,
    required this.selected,
    required this.options,
    required this.onChanged,
  });
  final String label;
  final String selected;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {

      return
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selected,
            isExpanded: true,
            dropdownColor: Theme.of(context).focusColor,
            style:Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: AppColors.greennColor,
                fontSize: 12,
              ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        );
    }
  }

