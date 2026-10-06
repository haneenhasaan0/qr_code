import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/covenant/screen/convenant_screen.dart';
import 'package:qr_code/features/delivery_and_receipt/screen/delivety_and_receipt.dart';
import 'package:qr_code/features/home/widget/driver_details.dart';
import 'package:qr_code/features/home/widget/list_of_month.dart';
import 'package:qr_code/features/msgs/screen/msgs_screen.dart';
import 'package:qr_code/features/rate/screen/rate_screen.dart';

import '../../nakalty/screen/nakalty_screen.dart';
import '../../odometer/screen/odometer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.userName,required this.driverName});
  final String userName;
  final String driverName;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets
                .symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.purpleColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "بوابة السائق",
                      style: AppStyles.bold.copyWith(color: AppColors.whiteColor)
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  "نظام نقلات Naolon",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
                ),
                SizedBox(height: 8,),
                DriverDetails(userName: userName,code: userName,),
                SizedBox(height: 12,),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.purpleColor,
                    tabs: [
                    Tab(child:Text( "📋 الشهور",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( "📸 نقلاتي",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( "🔢 عددات",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( "📩 رسائل",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( "🤝 تسليم وتسلم",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( " 💸 العهدة",style: Theme.of(context).textTheme.headlineMedium,)),
                    Tab(child:Text( "⛽ المعدل",style: Theme.of(context).textTheme.headlineMedium,)),
                  ],),
                ),
                Expanded(
                  child: TabBarView(children: [
                    ListOfMonth(driverName: driverName,),
                    NakaltyScreen(),
                    OdometerScreen(),
                    MsgScreen(),
                    DeliveryAndReceipt(),
                    CovenantScreen(),
                    RateScreen(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
