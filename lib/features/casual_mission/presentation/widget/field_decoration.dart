import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';


InputDecoration fieldDecoration(BuildContext context, String hint, IconData icon) {
  final border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.borderColor),
    borderRadius: BorderRadius.circular(8),
  );
  return InputDecoration(
    hintText: hint,
    hintStyle: Theme.of(context).textTheme.bodyMedium,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: Theme.of(context).scaffoldBackgroundColor,
    border: border,
    enabledBorder: border,
    focusedBorder: border,
  );
}