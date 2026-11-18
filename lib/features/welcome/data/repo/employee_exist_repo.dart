import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/welcome/data/model/employee_exist_response.dart';

class EmployeeExistRepo {
  /// [fleetStaffId] stays 0: the endpoint is a "does this employee no. exist"
  /// check, and passing the driver's own id would exclude him from the search.
  static Future<EmployeeExistResponse?> check(
    String employeeNo, {
    int fleetStaffId = 0,
  }) async {
    try {
      var response = await ApiProvider.get(
        endPoint: ApiConstants.employeeNoExist,
        queryParam: {
          "EmployeeNoSearch": employeeNo,
          "FleetStaffId": fleetStaffId,
        },
        header: {
          "Authorization": "Bearer ${SharedPref.getToken()}",
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        log('EmployeeNoExist RAW = ${response.data}');
        return EmployeeExistResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      log('status :${e.response?.statusCode}');
      log('data :${e.response?.data}');
    }
    return null;
  }
}
