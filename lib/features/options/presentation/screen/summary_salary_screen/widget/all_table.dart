import 'package:flutter/material.dart';
import 'package:qr_code/features/options/presentation/screen/summary_salary_screen/widget/build_filter.dart';

import 'build_table_row.dart';

class AllTable extends StatefulWidget {
  const AllTable({super.key});

  @override
  State<AllTable> createState() => _AllTableState();

}
class _AllTableState extends State<AllTable> {

  String selectedItem = 'الكل';

  String selectedValue = 'الكل';

  String selectedAmount = 'الكل';
  List<Map<String, String>> get filteredData {
    return data.where((row) {
      final matchItem =
          selectedItem == 'الكل' || row['item'] == selectedItem;

      final matchValue =
          selectedValue == 'الكل' || row['value'] == selectedValue;

      final matchAmount =
          selectedAmount == 'الكل' || row['amount'] == selectedAmount;

      return matchItem && matchValue && matchAmount;
    }).toList();
  }

  final List<Map<String, String>> data = [
    {'item': 'أيام العمل', 'value': '3 يوم', 'amount': '-'},
    {'item': 'أيام الإجازة', 'value': '0 يوم', 'amount': '-'},
    {'item': 'المرضي', 'value': '0 يوم', 'amount': '-'},
    {'item': 'الإجازة السنوية', 'value': '0 يوم', 'amount': '-'},
    {'item': 'الانتظار', 'value': '0 يوم', 'amount': '-'},
    {'item': 'الغياب', 'value': '0 يوم', 'amount': '-'},
    {'item': 'إذن الإضافي', 'value': '0 يوم', 'amount': '-'},
    {'item': 'إضافي إجازة', 'value': '1 يوم', 'amount': '-'},
    {'item': 'إضافي ليلي', 'value': '0 يوم', 'amount': '-'},
    {
      'item': 'إجمالي النقلات',
      'value': '16 نقلة',
      'amount': '٧,٤٥٠ ج.م'
    },
    {
      'item': 'البدلات',
      'value': '-',
      'amount': '٣,١٥٠ ج.م'
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                BuildFilter(
                  label: 'فلتر البند',
                  selected: selectedItem,
                  options: [
                    'الكل',
                    ...data.map((e) => e['item']!).toSet(),
                  ],
                  onChanged: (value) {
                    setState(() => selectedItem = value!);
                  },
                ),
                const SizedBox(width: 8),
                BuildFilter(
                  label: 'فلتر القيمة',
                  selected: selectedValue,
                  options: [
                    'الكل',
                    ...data.map((e) => e['value']!).toSet(),
                  ],
                  onChanged: (value) {
                    setState(() => selectedValue = value!);
                  },
                ),
                const SizedBox(width: 8),
                BuildFilter(
                  label: 'فلتر المبلغ',
                  selected: selectedAmount,
                  options: [
                    'الكل',
                    ...data.map((e) => e['amount']!).toSet(),
                  ],
                  onChanged: (value) {
                    setState(() => selectedAmount = value!);
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),
            BuildTableRow(
              item: 'البند',
              value: 'القيمة',
              amount: 'المبلغ (ج.م)',
              isHeader: true,
            ),
            if (filteredData.isEmpty)
               Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'لا توجد بيانات',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            else
              ...filteredData.map(
                    (row) => BuildTableRow(
                  item: row['item']!,
                  value: row['value']!,
                  amount: row['amount']!,
                ),
              ),

            const SizedBox(height: 8),
            BuildTableRow(
              item: 'الإجمالي النهائي',
              value: '',
              amount: '١٠,٦٠٠ ج.م',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}