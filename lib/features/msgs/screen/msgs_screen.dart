import 'package:flutter/material.dart';

import '../widget/msg_widget.dart';

class MsgScreen extends StatelessWidget {
  const MsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.only(left: 24, right: 24,top: 12,bottom: 12),
    child: SingleChildScrollView(child: MsgWidget()),
    );
  }
}
