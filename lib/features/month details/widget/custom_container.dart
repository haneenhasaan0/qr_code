import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.color, required this.icon, required this.text1, required this.text2,  this.iconColor});
  final Color color;
  final Color? iconColor;
  final IconData icon;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.simpleBLueColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black,spreadRadius: 3,blurRadius: 20,offset: Offset(0,4))
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(color: color.withOpacity(0.25),borderRadius: BorderRadius.circular(12),),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(icon,color: iconColor,size: 12,),
                ),
              ),
              SizedBox(width: 8,),
              Text(text1,style: AppStyles.semiBold.copyWith(color: AppColors.lightGrayColor),)
            ],
          ),
          SizedBox(height: 8,),
          Text(text2,style: AppStyles.bold,)
        ],),
      )
    );
  }
}
