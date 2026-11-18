import 'package:flutter/material.dart';

import '../widget/all_table.dart';

class SummarySalaryScreen extends StatelessWidget {
  const SummarySalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('ملخص الراتب'),
      ),
      backgroundColor: Theme.of(context).focusColor,
      body: SingleChildScrollView(
        child: AllTable(),
      ),
    );
  }
}
