import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/home/widget/theme.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        border: Border.symmetric(
        vertical: BorderSide.none,
        horizontal: BorderSide(color: AppColors.borderColor),
      ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.greenColor),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "انس محمد خطاب",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("الكود :12007",style: TextStyle(color: AppColors.borderColor),),
              ],
            ),
            Spacer(),
            Row(
              children: [
                ThemeIcon(),
                SizedBox(width: 4,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkRedColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("خروج",
                        style: AppStyles.bold.copyWith(color: AppColors.redColor)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
