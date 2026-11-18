import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

class BuildTableRow extends StatelessWidget {
  const BuildTableRow({super.key,
    required this.item,
    required this.value,
    required this.amount,
    this.isHeader = false,
    this.isTotal =false,
  });

  final String item;
  final String value;
  final String amount;
  final bool isHeader;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color:  Theme.of(context).scaffoldBackgroundColor,
          borderRadius:BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                item,
                textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                amount,
                textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium

              ),
            ),
          ],
        ),
      );
  }
}
