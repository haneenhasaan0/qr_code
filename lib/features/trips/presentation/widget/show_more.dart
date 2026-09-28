import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';

class ShowMore extends StatelessWidget {
  const ShowMore({super.key,required this.more});
  final bool more;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(microseconds: 200),
      curve: Curves.easeInOut,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(more?"اخفاء التفاصيل":"تفاصيل",style: AppStyles.medium14.copyWith(color: AppColors.whiteColor),),
            SizedBox(width: 4,),
            Icon(more?Icons.arrow_upward:Icons.arrow_downward,color: AppColors.whiteColor,),
          ],
        ),

      ),

    );

  }
}
