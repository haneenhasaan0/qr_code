import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/casual_mission/data/repo/get_vehicle_list_repo.dart';

/// أنواع المرفقات (من Driver/GetDropdownData -> attactmentType): رخصة / بطاقة.
typedef AttachmentTypeIds = ({int? licenseId, int? idCardId});

/// مرفق موجود للسواق (من driverAttachementJson).
typedef DriverAttachment = ({int id, int typeId, String url});

class DriverAttachmentRepo {
  /// بنجيب أنواع المرفقات من السيرفر وبنختار نوع الرخصة ونوع البطاقة من اسمهم.
  static Future<AttachmentTypeIds> getTypeIds() async {
    try {
      final res = await GetVehicleListRepo.getVehicleList();
      final types = res?.data.firstOrNull?.attactmentType ?? [];
      debugPrint('ATTACHMENT TYPES = ${types.map((t) => "${t.id}:${t.name}").toList()}');
      final licenseRe = RegExp(r'licen|رخص', caseSensitive: false);
      final idRe = RegExp(r'national|card|\bid\b|بطاق|هوي|قومي', caseSensitive: false);
      final license = types.where((t) => licenseRe.hasMatch(t.name)).firstOrNull?.id;
      final idCard = types
          .where((t) => t.id != license && idRe.hasMatch(t.name))
          .firstOrNull
          ?.id;
      return (licenseId: license, idCardId: idCard);
    } catch (e) {
      debugPrint('ATTACHMENT TYPES ERROR: $e');
      return (licenseId: null, idCardId: null);
    }
  }

  /// المرفقات الحالية للسواق من driverAttachementJson:
  /// [{id, uploadTypeId, uploadImagepath}] وبنبني رابط الصورة من عنوان السيرفر.
  static List<DriverAttachment> parse(String? json) {
    if (json == null || json.trim().isEmpty) return [];
    try {
      final host = Uri.parse(ApiConstants.baseUrl).origin;
      final list = jsonDecode(json) as List;
      return [
        for (final a in list.whereType<Map>())
          if (a['uploadImagepath'] != null)
            (
              id: int.tryParse('${a['id']}') ?? 0,
              typeId: int.tryParse('${a['uploadTypeId']}') ?? 0,
              url: '$host/${'${a['uploadImagepath']}'.replaceFirst(RegExp(r'^/+'), '')}',
            ),
      ];
    } catch (e) {
      debugPrint('ATTACHMENT PARSE ERROR: $e');
      return [];
    }
  }

  /// رفع صورة (رخصة أو بطاقة) على Driver/UploadDriverAttachment، بنفس شكل الـ FMS:
  /// EmployeeNo + Attachments[0].AttachmentTypeId + Attachments[0].Files
  static Future<bool> upload({
    required String employeeNo,
    required int typeId,
    required String filePath,
    required String fileName,
    int? replaceImageId,
  }) async {
    try {
      final form = FormData.fromMap({
        'EmployeeNo': employeeNo,
        'Attachments[0].AttachmentTypeId': typeId,
        'Attachments[0].Files':
            await MultipartFile.fromFile(filePath, filename: fileName),
        // لو فيه صورة قديمة من نفس النوع بنمسحها عشان تتبدل بالجديدة
        if (replaceImageId != null && replaceImageId > 0)
          'Attachments[0].DeletedImageIds': replaceImageId,
      });
      final res = await ApiProvider.put(
        endPoint: 'Driver/UploadDriverAttachment',
        data: form,
        header: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      log('UPLOAD ATTACHMENT STATUS = ${res.statusCode}');
      log('UPLOAD ATTACHMENT RESPONSE = ${res.data}');
      final body = res.data;
      final msg = body is Map ? '${body['message']}'.toLowerCase() : '';
      return res.statusCode == 200 && (body is! Map || msg.contains('success'));
    } on DioException catch (e) {
      log('UPLOAD ATTACHMENT STATUS: ${e.response?.statusCode}');
      log('UPLOAD ATTACHMENT DATA: ${e.response?.data}');
      return false;
    } catch (e) {
      log('UPLOAD ATTACHMENT ERROR: $e');
      return false;
    }
  }
}
