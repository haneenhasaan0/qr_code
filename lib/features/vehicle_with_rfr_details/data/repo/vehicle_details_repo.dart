import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/features/vehicle_details/data/model/vehicle_details_response.dart';

class VehicleDetailsRepo {
  static Future<VehicleDetailsResponse?> getVehicleDetails()async{
    try{
      var response = await ApiProvider.get(
          endPoint: ApiConstants.vehicleDetails, queryParam: {
        "IsDeleted": "false"
      });
      if (response.statusCode == 200) {
        try {
          print('RAW API DATA = ${response.data}');
          print('DRIVER DETAILS URL = ${response.requestOptions.uri}');

          final jsonData = Map<String, dynamic>.from(response.data);

          print('RESPONSE KEYS = ${jsonData.keys.toList()}');

          final result = VehicleDetailsResponse.fromJson(jsonData);

          print('PARSED VEHICLES COUNT = ${result.data.length}');

          if (result.data.isNotEmpty) {
            print('FIRST PLATE = ${result.data.first.licensePlate}');
          }

          return result;
        } catch (e, stackTrace) {
          log('PARSING ERROR: $e');
          log('PARSING STACK TRACE: $stackTrace');
          rethrow;
        }
      }

      return null;
    }
    on DioException catch (e, stackTrace) {
      log('DIO ERROR: $e');
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      log('URL: ${e.requestOptions.uri}');
      log('STACK TRACE: $stackTrace');
      rethrow;
    }
  }
}