import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class ShowMore extends StatelessWidget {
  const ShowMore({super.key,required this.more});
  final bool more;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2563EB),
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
