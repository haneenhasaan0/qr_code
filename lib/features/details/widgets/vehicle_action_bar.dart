// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qr_code/core/app_colors/app_colors.dart';
//
// class VehicleActionBar extends StatelessWidget {
//   final VoidCallback? onAllTripsPressed;
//   final VoidCallback? onAddOdometerPressed;
//   final VoidCallback? onMaintenancePressed;
//   final VoidCallback? onStartTripPressed;
//
//   const VehicleActionBar({
//     super.key,
//     this.onAllTripsPressed,
//     this.onAddOdometerPressed,
//     this.onMaintenancePressed,
//     this.onStartTripPressed,
//   });
//
//   Widget _buildActionButton({
//     required BuildContext context,
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 44,
//               height: 44,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Theme.of(context).focusColor,
//                 border: Border.all(color: AppColors.borderColor, width: 1.5),
//               ),
//               child: Icon(
//                 icon,
//                 color: const Color(0xFF334155),
//                 size: 20,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               label,
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16)
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:  BoxDecoration(
//         color: Theme.of(context).focusColor,
//         border: Border(
//           top: BorderSide(color: AppColors.borderColor, width: 1.5),
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: SafeArea(
//         top: false,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildActionButton(
//               context: context,
//               icon: Icons.alt_route_rounded,
//               label: 'كل الرحلات',
//               onTap: onAllTripsPressed ?? () {},
//             ),
//             _buildActionButton(
//               context: context,
//               icon: Icons.settings_outlined,
//               label: 'الصيانة',
//               onTap: onMaintenancePressed ?? () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
