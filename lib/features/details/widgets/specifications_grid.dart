import 'package:flutter/material.dart';
import 'package:qr_code/features/details/widgets/specification_card.dart';

class SpecificationsGrid extends StatelessWidget {

  const SpecificationsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'المواصفات',
          style: Theme.of(context).textTheme.bodyMedium
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SpecificationCard(
                label: 'موديل / نوع',
                value: "Volvo FH16", // Replace with vehicle.brandModel
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SpecificationCard(
                label: 'نوع',
                value: "ونش", // Replace with vehicle.type
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SpecificationCard(
                label: 'اسم السواق',
                value: "انس خطاب",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SpecificationCard(
                label: 'قراية العداد',
                value: "120,000 km"
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SpecificationCard(
                label: 'نوع البنزين',
                value: "جاز", // Replace with vehicle.fuelType
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SpecificationCard(
                label: 'سنة',
                value: "2000",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SpecificationCard(
                label: 'الحالة',
                value: "مسموح",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
