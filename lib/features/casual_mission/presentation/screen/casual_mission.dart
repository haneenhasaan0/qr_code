import 'package:flutter/material.dart';

import '../data/model/mission.dart';
import '../widget/field_decoration.dart';
import '../widget/mission_card.dart';
import '../widget/missions_bottom_bar.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});
  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  final missions = [Mission()];

  @override
  Widget build(BuildContext context) {
    final total = missions.fold<double>(0, (s, m) => s + m.total);
    return Scaffold(
      appBar: AppBar(
        title: const Text('المأموريات', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(decoration: const BoxDecoration(gradient: gradient)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: missions.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, i) => MissionCard(
          key: ObjectKey(missions[i]),
          number: i + 1,
          mission: missions[i],
          onChanged: () => setState(() {}),
          onDelete: () => setState(() => missions.removeAt(i)),
        ),
      ),
      bottomNavigationBar: MissionsBottomBar(
        count: missions.length,
        total: total,
        onAdd: () => setState(() => missions.add(Mission())),
      ),
    );
  }
}
