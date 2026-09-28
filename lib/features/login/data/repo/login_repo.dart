import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/login/data/model/login_response.dart';

class LoginRepo {
  static Future<LoginResponse?> login(String id, String password) async {
    try {
      final credentials = base64Encode(utf8.encode('$id:$password'));
      final response = await ApiProvider.post(
        endPoint: ApiConstants.login,
        data: {},
        header: {"Authorization": "Basic $credentials"},
      );
      var data = LoginResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        SharedPref.setToken(data.accessToken);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      log('URL: ${e.requestOptions.uri}');
      log('HEADERS: ${e.requestOptions.headers}');
      return null;
    }
  }
}
