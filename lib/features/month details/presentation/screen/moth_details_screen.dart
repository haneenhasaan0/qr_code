import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/month%20details/presentation/widget/no_of_trips_widget.dart';
import 'package:qr_code/features/trips/presentation/widget/trip_details_container.dart';
import '../widget/custom_container.dart';
import '../widget/month_widget.dart';

class MonthDetailsScreen extends StatelessWidget {
  const MonthDetailsScreen({
    super.key,
    required this.month,
    required this.driverName,
  });

  int getMonthNumber(String monthName) {
    const months = {
      'يناير': 1,
      'فبراير': 2,
      'مارس': 3,
      'أبريل': 4,
      'مايو': 5,
      'يونيو': 6,
      'يوليو': 7,
      'أغسطس': 8,
      'سبتمبر': 9,
      'أكتوبر': 10,
      'نوفمبر': 11,
      'ديسمبر': 12,
    };

    return months[monthName]!;
  }

  final String month;
  final String driverName;

  @override
  Widget build(BuildContext context) {
    final monthNumber = getMonthNumber(month);

    final year = DateTime.now().year;

    final startDate = DateTime(year, monthNumber, 1);

    final endDate = DateTime(year, monthNumber + 1, 0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),

      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
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
                     child: NoOfTripsWidget(driverName: driverName,start:startDate ,end: endDate,),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TabBar(
                  dividerColor: Colors.transparent,
                  labelStyle: AppStyles.medium14.copyWith(
                    color: AppColors.lightGrayColor,
                  ),
                  tabs: [
                    Text("ملخص الراتب"),
                    Text("تفاصيل النقلات"),
                    Text("البدلات والخصومات"),
                  ],
                ),
                SizedBox(
                  height:10000,
                  child: TabBarView(
                    children: [
                      Text("data"),
                      TripDetailsContainer(start: startDate, end: endDate,driverName: driverName,),
                      Text("data"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
