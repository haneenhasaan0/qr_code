import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';

class ApiProvider {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  static Future<Response<dynamic>> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? header,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParam,
      options: Options(headers: header),
    );
  }
  static Future<Response<dynamic>> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? header,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: queryParam,
      options: Options(headers: header),
    );
  }
  static Future<Response<dynamic>> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? header,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParam,
      options: Options(headers: header),
    );
  }
  static Future<Response<dynamic>> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? header,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: queryParam,
      options: Options(headers: header),
    );
  }
  static Future<Response<dynamic>> patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? header,
  }) async {
    return await dio.patch(
      endPoint,
      data: data,
      queryParameters: queryParam,
      options: Options(headers: header),
    );
  }

}
