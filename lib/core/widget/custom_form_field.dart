import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    this.fillColor,
    this.controller,
    this.borderSide,
    this.sufIcon,
    this.preIcon,
    required this.hintText,
    this.validator,
    this.style,
    this.hintStyle,
    this.lines,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.enabled
  });

  final BorderSide? borderSide;
  final Icon? sufIcon;
  final Icon? preIcon;
  final Color? fillColor;
  final int? lines;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: lines,
      style:style ,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        enabled: enabled ?? true,
        hintStyle: hintStyle == null?Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor):style,
        suffixIcon: sufIcon,
        suffixIconColor: AppColors.lightGrayColor,
        hintText: hintText,
        prefixIcon: preIcon,
        border: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Colors.white.withOpacity(0.12)),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
