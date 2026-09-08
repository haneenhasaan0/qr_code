import 'package:flutter/material.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/app_styles.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return             DropdownButtonFormField(

      borderRadius: BorderRadius.circular(16),
      dropdownColor:Theme.of(context).scaffoldBackgroundColor,
      style: AppStyles.semiBold.copyWith(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        hint: Text(
          "--اختر--",
          style: AppStyles.semiBold.copyWith(
            fontSize: 14,
            color: AppColors.lightGrayColor,
          ),
        ),
        filled: true,
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: AppColors.lightGrayColor,
        ),
        fillColor: Theme.of(context).focusColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
      items: [
        DropdownMenuItem(value: "option1", child: Text("طلب مأمورية",style: Theme.of(context).textTheme.bodyMedium,)),
        DropdownMenuItem(value: "option2", child: Text("طلب مستند", style: Theme.of(context).textTheme.bodyMedium,)),
        DropdownMenuItem(value: "option3", child: Text("شكوى",style: Theme.of(context).textTheme.bodyMedium,)),
      ],
      onChanged: (value) {},
    );

  }
}
