
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LicenseProvider extends ChangeNotifier {
  // كل سواق ليه رخصته: المفاتيح وأسماء الملفات بتتكتب بكود السواق
  String _id = '';

  Future<void> setUser(String id) async {
    if (id == _id) return;
    _id = id;
    _savedImagePath = null;
    _licenseFilePath = null;
    _licenseFileName = null;
    await loadSavedImage();
    await loadSavedLicenseFile();
  }

  String? _licenseFilePath;
  String? _licenseFileName;

  String? get licenseFilePath => _licenseFilePath;
  String? get licenseFileName => _licenseFileName;

  String? _savedImagePath;

  String? get savedImagePath => _savedImagePath;

  bool get hasSavedImage =>
      _savedImagePath != null &&
          File(_savedImagePath!).existsSync();

// استرجاع الصورة المحفوظة عند فتح التطبيق
  Future<void> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('saved_image_path_$_id');

    if (path != null && await File(path).exists()) {
      _savedImagePath = path;
    } else {
      _savedImagePath = null;
      await prefs.remove('saved_image_path_$_id');
    }

    notifyListeners();
  }

// حفظ الصورة بشكل دائم داخل ملفات التطبيق
  Future<void> saveImage(File image) async {
    final directory = await getApplicationDocumentsDirectory();

    final savedFile = await image.copy(
      '${directory.path}/saved_image_$_id.jpg',
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_image_path_$_id', savedFile.path);

    _savedImagePath = savedFile.path;
    notifyListeners();
  }

// حذف الصورة عند الحاجة فقط
  Future<void> removeSavedImage() async {
    if (_savedImagePath != null) {
      final file = File(_savedImagePath!);

      if (await file.exists()) {
        await file.delete();
      }
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_image_path_$_id');

    _savedImagePath = null;
    notifyListeners();
  }


// حفظ ملف PDF بشكل دائم
  Future<void> saveLicenseFile(PlatformFile file) async {
    final directory = await getApplicationDocumentsDirectory();

    final sourcePath = file.path;

    if (sourcePath == null) {
      throw Exception('مسار ملف الرخصة غير موجود');
    }

    final sourceFile = File(sourcePath);

    final savedFile = await sourceFile.copy(
      '${directory.path}/saved_license_$_id.pdf',
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('saved_license_path_$_id', savedFile.path);
    await prefs.setString('saved_license_name_$_id', file.name);

    _licenseFilePath = savedFile.path;
    _licenseFileName = file.name;

    notifyListeners();
  }

// استرجاع ملف PDF عند فتح التطبيق
  Future<void> loadSavedLicenseFile() async {
    final prefs = await SharedPreferences.getInstance();

    final path = prefs.getString('saved_license_path_$_id');
    final name = prefs.getString('saved_license_name_$_id');

    if (path != null && name != null && await File(path).exists()) {
      _licenseFilePath = path;
      _licenseFileName = name;
    } else {
      _licenseFilePath = null;
      _licenseFileName = null;

      await prefs.remove('saved_license_path_$_id');
      await prefs.remove('saved_license_name_$_id');
    }

    notifyListeners();
  }
}