/// Response of `Driver/EmployeeNoExist`:
/// `{ message, allRecords, access_token, data: [ { staffId, employeeNo,
/// fullName, dateAppointment, createdAt, isTerminated, ... } ] }`
class EmployeeExistResponse {
  EmployeeExistResponse({
    required this.exists,
    required this.hireDate,
    this.fullName,
    this.message,
  });

  final bool exists;

  /// `dateAppointment` (required for new drivers; null only on old records).
  final DateTime? hireDate;
  final String? fullName;
  final String? message;

  factory EmployeeExistResponse.fromJson(Map<dynamic, dynamic> json) {
    final data = json['data'];
    final records = data is List ? data : const [];
    final allRecords = json['allRecords'];
    final exists =
        records.isNotEmpty && (allRecords is! int || allRecords > 0);

    Map<dynamic, dynamic>? staff;
    if (records.isNotEmpty && records.first is Map) {
      staff = records.first as Map;
    }

    return EmployeeExistResponse(
      exists: exists,
      hireDate: _date(staff?['dateAppointment']),
      fullName: staff?['fullName']?.toString(),
      message: json['message']?.toString(),
    );
  }

  static DateTime? _date(dynamic value) =>
      value is String ? DateTime.tryParse(value) : null;
}
