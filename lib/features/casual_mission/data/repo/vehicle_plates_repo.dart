import 'dart:developer';

import 'package:qr_code/features/casual_mission/data/model/vehicle_list_reponse.dart';
import 'package:qr_code/features/casual_mission/data/repo/get_vehicle_list_repo.dart';

typedef VehicleOption = ({int id, String plate});

typedef VehicleLists = ({List<VehicleOption> tipper, List<VehicleOption> flatbed});

class VehiclePlatesRepo {
  static Future<VehicleLists> getLists() async {
    try {
      final response = await GetVehicleListRepo.getVehicleList();
      final data = response?.data.firstOrNull;
      if (data == null) return (tipper: <VehicleOption>[], flatbed: <VehicleOption>[]);

      return (
      tipper: _toOptions(data.vehicleTipper),
      flatbed: _toOptions(data.vehicleFlatbed),
      );
    } catch (e) {
      log('VehiclePlatesRepo error: $e');
      return (tipper: <VehicleOption>[], flatbed: <VehicleOption>[]);
    }
  }

  static List<VehicleOption> forSector(VehicleLists lists, int? sectorId) {
    final isTipper = (sectorId ?? 1) == 1;
    return isTipper ? lists.tipper : lists.flatbed;
  }

  static List<VehicleOption> _toOptions(List<AppointmentType> vehicles) {
    final ids = <int>{};
    final options = <VehicleOption>[];

    for (final vehicle in vehicles) {
      final plate = vehicle.name.trim();
      if (plate.isEmpty) continue;
      if (!ids.add(vehicle.id)) continue; // العربية دي اتضافت قبل كده

      options.add((id: vehicle.id, plate: plate));
    }
    return options;
  }
}
