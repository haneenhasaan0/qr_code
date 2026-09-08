import 'package:flutter/material.dart';
import 'package:qr_code/features/delivery_and_receipt/widget/delivery_and_receipt_widget.dart';

class DeliveryAndReceipt extends StatelessWidget {
  const DeliveryAndReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: DeliveryAndReceiptWidget(),
    );
  }
}
