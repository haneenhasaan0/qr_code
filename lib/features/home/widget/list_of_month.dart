import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/home/widget/month.dart';



class ListOfMonth extends StatelessWidget {
   ListOfMonth({super.key});
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
                context.push("/monthDetails",extra: months[index]);
              },
              child: Month(text: months[index]));
        },
        itemCount: months.length,
      ),
    );
  }
}
