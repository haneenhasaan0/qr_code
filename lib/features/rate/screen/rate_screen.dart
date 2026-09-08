import 'package:flutter/material.dart';
import 'package:qr_code/features/rate/widget/rate_widget.dart';

import '../../../core/app_styles/app_styles.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          RateWidget(),
          SizedBox(height: 32,),
          Text("📋",style: TextStyle(fontSize: 24),),
          SizedBox(height: 8,),
          Text("مفيش أي معدل معتمد ليك حالياً", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
