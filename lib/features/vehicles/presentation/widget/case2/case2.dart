import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';
import 'package:qr_code/features/vehicle_details/widget/case2/presentation/cubit/rfr_details.dart';
import 'package:qr_code/features/vehicles/presentation/widget/current_location.dart';

class Case2 extends StatelessWidget {
  const Case2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RfrDetails(
          type: "قطاع العمل",
          text1: "السلع",
          text2: "البترول",
          text3: "خدمات اسكاي",
          text4: "شاحنات الايجار",
          text5: "خدمات الخدمة الخفيفة",
        ),
        SizedBox(height: 24),
        RfrDetails(
          type: "حالة مركبة البلاغ",
          text1: "متحرك حامل",
          text2: "متحرك فاضي",
          text3: "واقف حامل",
          text4: "واقف فاضي",
        ),
        SizedBox(height: 24,),
        CustomFormField(
          borderSide: BorderSide(color: AppColors.borderColor),
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.black),
          hintText: "تفاصيل عن البلاغ",fillColor: Theme.of(context).focusColor,
        ),
        SizedBox(height: 24,),
       CurrentLocationField(),
        SizedBox(height: 24,),
        ElevatedButton(onPressed: (){}, child: Text("انشئ بلاغ"))
      ],
    );
  }
}
