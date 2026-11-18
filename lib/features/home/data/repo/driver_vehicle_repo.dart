import 'package:flutter/foundation.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';

/// العربية المربوطة بالسواق (من Driver/SearchByEmployeeNo).
typedef LinkedVehicle = ({int? id, String? plate});

/// الـ endpoint بيرجّع السواق ومعاه العربية المربوطة بيه
/// (vehicleId / vehiclePlateNumber). لو السواق مش مربوط بعربية بنرجّع null.
class DriverVehicleRepo {
  static Future<LinkedVehicle?> getLinkedVehicle(String employeeNo) async {
    try {
      final response = await ApiProvider.get(
        endPoint: ApiConstants.driverSearchByEmployeeNo,
        queryParam: {'EmployeeNo': employeeNo},
        header: {
          'Authorization': 'Bearer ${SharedPref.getToken()}',
          'Accept': 'application/json',
        },
      );
      final list = response.data['data'] as List? ?? [];
      debugPrint('LINKED employeeNo="$employeeNo" status=${response.statusCode} records=${list.length} '
          'vehicleId=${list.isEmpty ? null : list.first['vehicleId']} '
          'plate=${list.isEmpty ? null : list.first['vehiclePlateNumber']}');
      if (list.isEmpty) return null;
      final id = int.tryParse(list.first['vehicleId']?.toString() ?? '');
      final plate = list.first['vehiclePlateNumber']?.toString().trim();
      final hasPlate = plate != null && plate.isNotEmpty;
      if (id == null && !hasPlate) return null;
      return (id: id, plate: hasPlate ? plate : null);
    } catch (e) {
      debugPrint('LINKED ERROR employeeNo="$employeeNo": $e');
      return null;
    }
  }

  /// الـ driverId بتاع السواق (من نفس الـ endpoint) - بنبعته مع البلاغ (RFR)
  /// عشان اسم السواق يظهر في السيستم. بيرجّع null لو السواق مش لاقيينه.
  static Future<int?> getDriverId(String employeeNo) async {
    try {
      final response = await ApiProvider.get(
        endPoint: ApiConstants.driverSearchByEmployeeNo,
        queryParam: {'EmployeeNo': employeeNo},
        header: {
          'Authorization': 'Bearer ${SharedPref.getToken()}',
          'Accept': 'application/json',
        },
      );
      final list = response.data['data'] as List? ?? [];
      if (list.isEmpty) return null;
      return int.tryParse(list.first['driverId']?.toString() ?? '');
    } catch (e) {
      debugPrint('DRIVER ID ERROR employeeNo="$employeeNo": $e');
      return null;
    }
  }

  static Future<String?> getPlate(String employeeNo) async =>
      (await getLinkedVehicle(employeeNo))?.plate;
}
