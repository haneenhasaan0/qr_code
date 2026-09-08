import 'package:flutter/material.dart';

class RecentScan extends StatelessWidget {
  const RecentScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.qr_code,color: Color(0xFF475569),size: 16,),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("AB-1234-CD",style:Theme.of(context).textTheme.bodyLarge,),
                Text("Volvo FH16",style: TextStyle(color: Color(0xFF475569),fontSize: 12),),
              ],
            ),
            Spacer(),
            Text("12/12/2023",style: TextStyle(color: Color(0xFF475569),fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
