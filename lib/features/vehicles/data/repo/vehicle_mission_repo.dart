import 'package:flutter/foundation.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';

/// بيانات مأمورية العربية: السواق والمشروع والتريلا المربوطين بيها.
typedef VehicleMission = ({int? driverId, int? projectId, int? trailerId});

class VehicleMissionRepo {
  /// نفس اللي صفحة إنشاء الـ RFR في الـ FMS بتعمله: بتجيب مأمورية العربية
  /// (PMRequest/GetMissionByVehicleId) وبتاخد منها DriverId وProjectId وTrailerId.
  static Future<VehicleMission?> getByVehicleId(int vehicleId) async {
    try {
      final response = await ApiProvider.get(
        endPoint: 'PMRequest/GetMissionByVehicleId',
        queryParam: {'VehicleId': vehicleId},
        header: {
          'Authorization': 'Bearer ${SharedPref.getToken()}',
          'Accept': 'application/json',
        },
      );
      final data = response.data['data'];
      debugPrint('RFR mission for vehicle $vehicleId: message=${response.data['message']} '
          'records=${data is List ? data.length : data}');
      if (data is! List || data.isEmpty) return null;
      final m = data.first;
      int? n(dynamic v) => int.tryParse(v?.toString() ?? '');
      return (
        driverId: n(m['driverId']),
        projectId: n(m['projectId']),
        trailerId: n(m['trailerId']),
      );
    } catch (e) {
      debugPrint('RFR mission ERROR vehicle $vehicleId: $e');
      return null;
    }
  }
}
