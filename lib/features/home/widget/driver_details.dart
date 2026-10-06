import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/home/widget/theme.dart';
import 'package:qr_code/features/login/presentation/widget/user_name_widget.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key,required this.userName,required this.code});

 final String userName;
 final String code;
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
                UserNameWidget(code: code,),
                Text("الكود :$userName",style: TextStyle(color: AppColors.borderColor),),
              ],
            ),
            Spacer(),
            Row(
              children: [
                ThemeIcon(),
                SizedBox(width: 4,), InkWell(
                  onTap: (){
                    SharedPref.setLoggedIn(false);

                    context.go('/login');
                  },
                  child: Container(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
