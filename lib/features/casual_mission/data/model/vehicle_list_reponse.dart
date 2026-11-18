import 'dart:convert';

VehicleListReponse vehicleListReponseFromJson(String str) => VehicleListReponse.fromJson(json.decode(str));

List<T> _list<T>(dynamic v, T Function(Map<dynamic, dynamic>) f) =>
    v is List ? v.whereType<Map>().map((e) => f(e)).toList() : <T>[];
String _str(dynamic v) => v?.toString() ?? '';
int _int(dynamic v) => v is num ? v.toInt() : int.tryParse('$v') ?? 0;
double _dbl(dynamic v) => v is num ? v.toDouble() : double.tryParse('$v') ?? 0.0;
bool _bool(dynamic v) => v is bool ? v : '$v'.toLowerCase() == 'true';

String vehicleListReponseToJson(VehicleListReponse data) => json.encode(data.toJson());

class VehicleListReponse {
    VehicleListReponse({
        required this.data,
        required this.message,
    });

    List<Datum> data;
    String message;

    factory VehicleListReponse.fromJson(Map<dynamic, dynamic> json) => VehicleListReponse(
        data: _list(json["data"], Datum.fromJson),
        message: _str(json["message"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        required this.businessSector,
        required this.appointmentType,
        required this.attactmentType,
        required this.driverFlatbed,
        required this.jobTitle,
        required this.roles,
        required this.garage,
        required this.insuranceType,
        required this.casualMissionType,
        required this.vehicleTipper,
        required this.visaStatus,
        required this.vehicleFlatbed,
        required this.medicalStatus,
        required this.site,
        required this.licenseIssuer,
        required this.licenseDegree,
        required this.sustainableMehwarPermit,
        required this.department,
        required this.tempMehwarPermit,
        required this.driverTipper,
        required this.insuranceCompany,
        required this.vehicleType,
        required this.attendanceStatus,
    });

    List<AppointmentType> businessSector;
    List<AppointmentType> appointmentType;
    List<AppointmentType> attactmentType;
    List<AppointmentType> driverFlatbed;
    List<AppointmentType> jobTitle;
    List<AppointmentType> roles;
    List<AppointmentType> garage;
    List<AppointmentType> insuranceType;
    List<CasualMissionType> casualMissionType;
    List<AppointmentType> vehicleTipper;
    List<dynamic> visaStatus;
    List<AppointmentType> vehicleFlatbed;
    List<dynamic> medicalStatus;
    List<AppointmentType> site;
    List<AppointmentType> licenseIssuer;
    List<AppointmentType> licenseDegree;
    List<dynamic> sustainableMehwarPermit;
    List<AppointmentType> department;
    List<dynamic> tempMehwarPermit;
    List<AppointmentType> driverTipper;
    List<AppointmentType> insuranceCompany;
    List<AppointmentType> vehicleType;
    List<AttendanceStatus> attendanceStatus;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        businessSector: _list(json["businessSector"], AppointmentType.fromJson),
        appointmentType: _list(json["appointmentType"], AppointmentType.fromJson),
        attactmentType: _list(json["attactmentType"], AppointmentType.fromJson),
        driverFlatbed: _list(json["driverFlatbed"], AppointmentType.fromJson),
        jobTitle: _list(json["jobTitle"], AppointmentType.fromJson),
        roles: _list(json["roles"], AppointmentType.fromJson),
        garage: _list(json["garage"], AppointmentType.fromJson),
        insuranceType: _list(json["insuranceType"], AppointmentType.fromJson),
        casualMissionType: _list(json["casualMissionType"], CasualMissionType.fromJson),
        vehicleTipper: _list(json["vehicleTipper"], AppointmentType.fromJson),
        visaStatus: List<dynamic>.from((json["visaStatus"] as List?) ?? const []),
        vehicleFlatbed: _list(json["vehicleFlatbed"], AppointmentType.fromJson),
        medicalStatus: List<dynamic>.from((json["medicalStatus"] as List?) ?? const []),
        site: _list(json["site"], AppointmentType.fromJson),
        licenseIssuer: _list(json["licenseIssuer"], AppointmentType.fromJson),
        licenseDegree: _list(json["licenseDegree"], AppointmentType.fromJson),
        sustainableMehwarPermit: List<dynamic>.from((json["sustainableMehwarPermit"] as List?) ?? const []),
        department: _list(json["department"], AppointmentType.fromJson),
        tempMehwarPermit: List<dynamic>.from((json["tempMehwarPermit"] as List?) ?? const []),
        driverTipper: _list(json["driverTipper"], AppointmentType.fromJson),
        insuranceCompany: _list(json["insuranceCompany"], AppointmentType.fromJson),
        vehicleType: _list(json["vehicleType"], AppointmentType.fromJson),
        attendanceStatus: _list(json["attendanceStatus"], AttendanceStatus.fromJson),
    );

    Map<dynamic, dynamic> toJson() => {
        "businessSector": List<dynamic>.from(businessSector.map((x) => x.toJson())),
        "appointmentType": List<dynamic>.from(appointmentType.map((x) => x.toJson())),
        "attactmentType": List<dynamic>.from(attactmentType.map((x) => x.toJson())),
        "driverFlatbed": List<dynamic>.from(driverFlatbed.map((x) => x.toJson())),
        "jobTitle": List<dynamic>.from(jobTitle.map((x) => x.toJson())),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "garage": List<dynamic>.from(garage.map((x) => x.toJson())),
        "insuranceType": List<dynamic>.from(insuranceType.map((x) => x.toJson())),
        "casualMissionType": List<dynamic>.from(casualMissionType.map((x) => x.toJson())),
        "vehicleTipper": List<dynamic>.from(vehicleTipper.map((x) => x.toJson())),
        "visaStatus": List<dynamic>.from(visaStatus.map((x) => x)),
        "vehicleFlatbed": List<dynamic>.from(vehicleFlatbed.map((x) => x.toJson())),
        "medicalStatus": List<dynamic>.from(medicalStatus.map((x) => x)),
        "site": List<dynamic>.from(site.map((x) => x.toJson())),
        "licenseIssuer": List<dynamic>.from(licenseIssuer.map((x) => x.toJson())),
        "licenseDegree": List<dynamic>.from(licenseDegree.map((x) => x.toJson())),
        "sustainableMehwarPermit": List<dynamic>.from(sustainableMehwarPermit.map((x) => x)),
        "department": List<dynamic>.from(department.map((x) => x.toJson())),
        "tempMehwarPermit": List<dynamic>.from(tempMehwarPermit.map((x) => x)),
        "driverTipper": List<dynamic>.from(driverTipper.map((x) => x.toJson())),
        "insuranceCompany": List<dynamic>.from(insuranceCompany.map((x) => x.toJson())),
        "vehicleType": List<dynamic>.from(vehicleType.map((x) => x.toJson())),
        "attendanceStatus": List<dynamic>.from(attendanceStatus.map((x) => x.toJson())),
    };
}

class AppointmentType {
    AppointmentType({
        required this.name,
        required this.id,
    });

    String name;
    int id;

    factory AppointmentType.fromJson(Map<dynamic, dynamic> json) => AppointmentType(
        name: _str(json["name"]),
        id: _int(json["id"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}

class AttendanceStatus {
    AttendanceStatus({
        required this.attendanceStatusNameEn,
        required this.code,
        required this.isDeleted,
        required this.attendanceStatusNameAr,
        required this.id,
        required this.wage,
        this.parentAttendanceStatusId,
    });

    String attendanceStatusNameEn;
    String code;
    bool isDeleted;
    String attendanceStatusNameAr;
    int id;
    double wage;
    int? parentAttendanceStatusId;

    factory AttendanceStatus.fromJson(Map<dynamic, dynamic> json) => AttendanceStatus(
        attendanceStatusNameEn: _str(json["attendanceStatusNameEn"]),
        code: _str(json["code"]),
        isDeleted: _bool(json["isDeleted"]),
        attendanceStatusNameAr: _str(json["attendanceStatusNameAr"]),
        id: _int(json["id"]),
        wage: _dbl(json["wage"]),
        parentAttendanceStatusId: json["parentAttendanceStatusId"] == null ? null : _int(json["parentAttendanceStatusId"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "attendanceStatusNameEn": attendanceStatusNameEn,
        "code": code,
        "isDeleted": isDeleted,
        "attendanceStatusNameAr": attendanceStatusNameAr,
        "id": id,
        "wage": wage,
        "parentAttendanceStatusId": parentAttendanceStatusId,
    };
}

class CasualMissionType {
    CasualMissionType({
        required this.casualMissionTypeNameAr,
        required this.code,
        required this.isDeleted,
        required this.defaultDays,
        required this.defaultValue,
        required this.casualMissionTypeNameEn,
        required this.id,
    });

    String casualMissionTypeNameAr;
    String code;
    bool isDeleted;
    int defaultDays;
    double defaultValue;
    String casualMissionTypeNameEn;
    int id;

    factory CasualMissionType.fromJson(Map<dynamic, dynamic> json) => CasualMissionType(
        casualMissionTypeNameAr: _str(json["casualMissionTypeNameAr"]),
        code: _str(json["code"]),
        isDeleted: _bool(json["isDeleted"]),
        defaultDays: _int(json["defaultDays"]),
        defaultValue: _dbl(json["defaultValue"]),
        casualMissionTypeNameEn: _str(json["casualMissionTypeNameEn"]),
        id: _int(json["id"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "casualMissionTypeNameAr": casualMissionTypeNameAr,
        "code": code,
        "isDeleted": isDeleted,
        "defaultDays": defaultDays,
        "defaultValue": defaultValue,
        "casualMissionTypeNameEn": casualMissionTypeNameEn,
        "id": id,
    };
}