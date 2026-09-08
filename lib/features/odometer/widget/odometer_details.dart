import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';

class OdometerDetails extends StatelessWidget {
  const OdometerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.simpleBLueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "بيانات العداد",
              style: AppStyles.extraBold32.copyWith(
                fontSize: 16,
                color: AppColors.yellowColor,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "رقم العربية",
              style: AppStyles.semiBold.copyWith(fontSize: 14),
            ),
            CustomFormField(
              hintText: "اكتب كود العربية أو رقم اللوحة... (300 عربية)",
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            SizedBox(height: 20,),
            Text(
              "قراءة العداد (كم)",
              style: AppStyles.semiBold.copyWith(fontSize: 14),
            ),
            CustomFormField(
              hintText: "مثال: 123456",
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            SizedBox(height: 20,),
            Text(
              " ملاحظات اختياري",
              style: AppStyles.semiBold.copyWith(fontSize: 14),
            ),
            CustomFormField(
              hintText:"أي ملاحظات...",
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
