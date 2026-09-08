import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class Month extends StatelessWidget {
  const Month({super.key,required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Icon(Icons.calendar_month,color: AppColors.borderColor,),
            SizedBox(width: 4,),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,

            ),
            Spacer(),
            Icon(Icons.arrow_forward,size: 24,color: AppColors.purpleColor,)
          ],
        ),
      ),
    );
  }
}
