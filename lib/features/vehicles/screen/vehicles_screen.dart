import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/features/details/widgets/vehicle_header_card.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Active Vehicles',
            style: TextStyle(
              color: Color(0xFF475569),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () => context.push('/details'),
            borderRadius: BorderRadius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VehicleHeaderCard(),
            ),
          ),
        ],
      ),
    );
  }
}
