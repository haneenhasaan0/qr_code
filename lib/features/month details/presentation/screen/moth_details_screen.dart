import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/month%20details/presentation/widget/no_of_trips_widget.dart';
import 'package:qr_code/features/options/presentation/widget/option_widget.dart';
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
    print('MONTH DETAILS DRIVER NAME = "$driverName"');
    print('MONTH DETAILS MONTH = "$month"');
    final monthNumber = getMonthNumber(month);

    final year = DateTime.now().year;

    final startDate = DateTime(year, monthNumber, 1);

    final endDate = DateTime(year, monthNumber + 1, 0);
    // ظهور تدريجي: كل عنصر يطلع من تحت بعد اللي قبله
    Widget pop(int i, Widget child) => TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: 400 + i * 120),
          curve: Curves.easeOutCubic,
          builder: (_, v, c) => Opacity(opacity: v, child: Transform.translate(offset: Offset(0, 30 * (1 - v)), child: c)),
          child: child,
        );
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل $month')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              pop(0, MonthWidget(month: month)),
              pop(1, Row(
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
              )),
              pop(2, Row(
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
                    child: NoOfTripsWidget(
                      driverName: driverName,
                      start: startDate,
                      end: endDate,
                    ),
                  ),
                ],
              )),
              pop(3, const OptionWidget(text: "ملخص الراتب", screen: "/summary_salary", icon: Icons.receipt_long_outlined, color: Color(0xFF10B981))),
              pop(4, OptionWidget(text: "تفاصيل النقلات", screen: "/trips_details", icon: Icons.local_shipping_outlined, color: const Color(0xFF0EA5E9), extra: {
                "start": startDate,
                "end": endDate,
                "driverName": driverName,
              })),
              pop(5, const OptionWidget(text: "البدلات والخصومات", screen: "/allowances_deductions", icon: Icons.account_balance_wallet_outlined, color: Color(0xFFF59E0B))),
              SizedBox(height: 12,)
            ],
          ),
        ),
      ),
    );
  }
}
