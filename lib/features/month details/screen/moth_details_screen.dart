import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/month%20details/widget/custom_container.dart';
import 'package:qr_code/features/month%20details/widget/month_widget.dart';

class MonthDetailsScreen extends StatelessWidget {
  const MonthDetailsScreen({super.key, required this.month});

  final String month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlueColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
      ),
      backgroundColor: AppColors.darkBlueColor,
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MonthWidget(month: month),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: AppColors.greenColor,
                      icon: Icons.monetization_on_rounded,
                      iconColor: Colors.white,
                      text1: "اجمالي الراتب",
                      text2: "١٠٬٦٠٠ ج.م",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomContainer(
                      color: AppColors.darkBlueColor,
                      icon: Icons.calendar_month,
                      iconColor: Colors.white,
                      text1: "ايام العمل",
                      text2: "3 يوم",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: AppColors.yellowColor,
                      iconColor: Colors.white,
                      icon: Icons.timelapse_outlined,
                      text1: "الايام الاضافية",
                      text2: "5 يوم",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomContainer(
                      color: AppColors.purpleColor,
                      icon: Icons.local_shipping,
                      iconColor: Colors.white,
                      text1: "النقلات",
                      text2: "16 نقلة",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelStyle: AppStyles.medium14.copyWith(
                    color: AppColors.lightGrayColor,
                  ),
                  tabs: [
                    Text("تفاصيل النقلات"),
                    Text("البدلات والخصومات"),
                    Text("السائق"),
                  ],
                ),
              ),
              Expanded(child: TabBarView(children: [
                Text("data"),
                Text("data"),
                Text("data"),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
