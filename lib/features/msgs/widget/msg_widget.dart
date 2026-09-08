import 'dart:ui' as BorderType;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/widget/custom_form_field.dart';
import 'package:qr_code/features/msgs/widget/drop_down_widget.dart';

import '../../../core/app_colors/app_colors.dart';

class MsgWidget extends StatelessWidget {
  const MsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "📤 ابعت طلب أو شكوى",
             style: AppStyles.bold.copyWith(color: AppColors.purpleColor, fontSize: 16)),

            SizedBox(height: 12),
            Text(
              "نوع الطلب",
              style: AppStyles.semiBold.copyWith(
                color: AppColors.lightGrayColor,
              ),
            ),
            DropDownWidget(),
            SizedBox(height: 24),
            Text(
              " التفاصيل",
              style: AppStyles.semiBold.copyWith(
                color: AppColors.lightGrayColor,
              ),
            ),
            CustomFormField(
              fillColor: Theme.of(context).focusColor,
              hintText: "أدخل التفاصيل....",
              lines: 3,
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            SizedBox(height: 32),
               DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.purpleColor,
                  strokeWidth: 1.5,
                  dashPattern: const [6, 4],
                  radius: const Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.purpleColor,
                        size: 24,
                      ),
                      Text(
                        ' ارفع صور (اختياري)',
                        style: AppStyles.bold.copyWith(
                          fontSize: 16,
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.yellowColor),
              onPressed: () {},
              child: Text(
                "ارسال طلب ",
                style: AppStyles.semiBold.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
