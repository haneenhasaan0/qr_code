import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/licence/data/model/driver_details_reponse.dart';

class DriverDetailsRepo {
  static Future<DriverDetailsReponse?> getDriverDetails() async {
    try {
      var response = await ApiProvider.get(
        endPoint: ApiConstants.driverDetails,
        queryParam: {
          "IsDeleted":"false"
        },
        header:
        { "Authorization": "Bearer ${SharedPref.getToken()}",
          'Accept': 'application/json',
        }

      );
      if (response.statusCode == 200) {
        try {
          print('RAW API DATA = ${response.data}');
          print('DRIVER DETAILS URL = ${response.requestOptions.uri}');
          print('RESPONSE KEYS = ${(response.data as Map).keys.toList()}');
          return DriverDetailsReponse.fromJson(
            Map<String, dynamic>.from(response.data),
          );
        } catch (e, stackTrace) {
          log('PARSING ERROR: $e');
          log('PARSING STACK TRACE: $stackTrace');
          rethrow;
        }
      } else {
        return null;
      }
    } on DioException catch (e, stackTrace) {
      log('DIO ERROR: $e');
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      log('URL: ${e.requestOptions.uri}');
      log('STACK TRACE: $stackTrace');
      rethrow;
    }
  }
}
