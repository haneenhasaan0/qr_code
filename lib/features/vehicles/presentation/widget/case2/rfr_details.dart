
import 'package:flutter/material.dart';

import '../../../../../../core/app_colors/app_colors.dart';

class RfrDetails extends StatefulWidget {
  const RfrDetails({
    super.key,
    required this.type,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
  });

  final String? text1, text2, text3, text4, text5, text6;
  final String type;

  @override
  State<RfrDetails> createState() => _RfrDetailsState();
}

class _RfrDetailsState extends State<RfrDetails> {
  String? selectedStatus;

  late final List<String> statuses = [
    widget.text1,
    widget.text2,
    widget.text3,
    widget.text4,
    widget.text5,
    widget.text6,
  ].whereType<String>().toList();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedStatus,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: widget.type,
        filled: true,
        fillColor: Theme.of(context).focusColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      hint: Text('اختار العنصر',style: Theme.of(context).textTheme.bodyMedium,),

      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(12),
      menuMaxHeight: 200,

      icon: const Icon(Icons.keyboard_arrow_down_rounded),

      items: statuses.map((status) {
        return DropdownMenuItem<String>(
          value: status,
          child: Text(
            status,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
        );
      }).toList(),

      onChanged: (value) {
        setState(() {
          selectedStatus = value;
        });
      },
    );
  }
}
