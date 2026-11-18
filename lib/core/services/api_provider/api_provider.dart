import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';

class ApiProvider {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
      // أي خطأ غير 401 (أو طلب اللوجين نفسه): سيبه يعدّي زي ما هو
      if (error.response?.statusCode != 401 || error.requestOptions.path.contains('Login/')) {
        return handler.next(error);
      }
      try {
        final res = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)).post(
          ApiConstants.refreshToken,
          data: FormData.fromMap({'refeshtoken': SharedPref.getRefToken()}),
        );
        SharedPref.setToken(res.data['accessToken']);
        SharedPref.setRefreshToken(res.data['refreshToken']);
        error.requestOptions.headers['Authorization'] = 'Bearer ${SharedPref.getToken()}';
        handler.resolve(await dio.fetch(error.requestOptions));
      } catch (_) {
        SharedPref.setLoggedIn(false);
        handler.next(error);
      }
    }));
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
