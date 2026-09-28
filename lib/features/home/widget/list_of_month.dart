import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/home/widget/month.dart';



class ListOfMonth extends StatelessWidget {
   ListOfMonth({super.key,required this.name});
   final String name;
  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 80,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                print("MONTH = ${months[index]}");
                print("DRIVER NAME = $name");
                context.push("/monthDetails",extra: {
                "month":months[index],
                "driverName":name
                });
              },
              child: Month(text: months[index]));
        },
        itemCount: months.length,
      ),
    );
  }
}
