import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/services/api_provider/api_constants.dart';
import '../../../../core/services/api_provider/api_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../model/rfr_vehicle_details.dart';

class RfrVehicleRepo {
  static Future<RfrVehicleDetailsResponse?> getVehicleDetails() async {
    try {
      final token = SharedPref.getToken();

      print('TOKEN EXISTS: ${token.toString().isNotEmpty}');

      final response = await ApiProvider.get(
        endPoint: ApiConstants.rfrVehicleDetails,
        queryParam: {"IsDeleted": "false"},
        header: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {     try {
        print('RAW API DATA = ${response.data}');
        print('DRIVER DETAILS URL = ${response.requestOptions.uri}');

        final jsonData = Map<String, dynamic>.from(response.data);

        print('RESPONSE KEYS = ${jsonData.keys.toList()}');

        final result = RfrVehicleDetailsResponse.fromJson(jsonData);

        print('PARSED VEHICLES COUNT = ${result.data.length}');

        if (result.data.isNotEmpty) {
          print('FIRST PLATE = ${result.data.first.vehiclePlateNumber}');
        }

        return result;
      } catch (e, stackTrace) {
        log('PARSING ERROR: $e');
        log('PARSING STACK TRACE: $stackTrace');
        rethrow;
      }}
    } on DioException catch (e, stackTrace) {
      log('RFR STATUS: ${e.response?.statusCode}');
      log('RFR DATA: ${e.response?.data}');
      log('RFR URL: ${e.requestOptions.uri}');
      log(
        'AUTH HEADER SENT: ${e.requestOptions.headers.containsKey('Authorization')}',
      );
      log('ERROR: $e');
      log('STACK TRACE: $stackTrace');
      rethrow;
    }
    return null;
  }
}

