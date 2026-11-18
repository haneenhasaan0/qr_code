import 'package:flutter/material.dart';

// بيانات تجريبية — استبدلها بالداتا الجاية من الـ API
const drivers = ['11030 - محمود عبدالرازق احمد خطيرى', '11045 - احمد محمد السيد'];
const vehicles = ['ل س 3672', 'ط ر 1845'];
const types = ['صيانة', 'نقل', 'مأمورية'];

class Mission {
  String? driver, vehicle, type;
  DateTime date = DateTime.now();
  final details = TextEditingController(), days = TextEditingController(), value = TextEditingController();
  double get total => (double.tryParse(days.text) ?? 0) * (double.tryParse(value.text) ?? 0);
}
