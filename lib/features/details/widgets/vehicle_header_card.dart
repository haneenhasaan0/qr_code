import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/home/widget/theme.dart';

class VehicleHeaderCard extends StatelessWidget {
  const VehicleHeaderCard({super.key});

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
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.greenColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.vector,
                  color: AppColors.bgLight,height: 20,width: 20,),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ABC-1234",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("ID: VH-00217 • Volvo FH16",style: TextStyle(color: AppColors.borderColor),),
              ],
            ),
            Spacer(),
            Row(
              children: [
                ThemeIcon(),
                SizedBox(width: 4,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkGreenColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("شغالة",
                        style: AppStyles.bold.copyWith(color: AppColors.greenColor)
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
