/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

VehicleListReponse vehicleListReponseFromJson(String str) => VehicleListReponse.fromJson(json.decode(str));

String vehicleListReponseToJson(VehicleListReponse data) => json.encode(data.toJson());

class VehicleListReponse {
    VehicleListReponse({
        required this.data,
        required this.message,
    });

    List<Datum> data;
    String message;

    factory VehicleListReponse.fromJson(Map<dynamic, dynamic> json) => VehicleListReponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
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
        businessSector: List<AppointmentType>.from(json["businessSector"].map((x) => AppointmentType.fromJson(x))),
        appointmentType: List<AppointmentType>.from(json["appointmentType"].map((x) => AppointmentType.fromJson(x))),
        attactmentType: List<AppointmentType>.from(json["attactmentType"].map((x) => AppointmentType.fromJson(x))),
        driverFlatbed: List<AppointmentType>.from(json["driverFlatbed"].map((x) => AppointmentType.fromJson(x))),
        jobTitle: List<AppointmentType>.from(json["jobTitle"].map((x) => AppointmentType.fromJson(x))),
        roles: List<AppointmentType>.from(json["roles"].map((x) => AppointmentType.fromJson(x))),
        garage: List<AppointmentType>.from(json["garage"].map((x) => AppointmentType.fromJson(x))),
        insuranceType: List<AppointmentType>.from(json["insuranceType"].map((x) => AppointmentType.fromJson(x))),
        casualMissionType: List<CasualMissionType>.from(json["casualMissionType"].map((x) => CasualMissionType.fromJson(x))),
        vehicleTipper: List<AppointmentType>.from(json["vehicleTipper"].map((x) => AppointmentType.fromJson(x))),
        visaStatus: List<dynamic>.from(json["visaStatus"].map((x) => x)),
        vehicleFlatbed: List<AppointmentType>.from(json["vehicleFlatbed"].map((x) => AppointmentType.fromJson(x))),
        medicalStatus: List<dynamic>.from(json["medicalStatus"].map((x) => x)),
        site: List<AppointmentType>.from(json["site"].map((x) => AppointmentType.fromJson(x))),
        licenseIssuer: List<AppointmentType>.from(json["licenseIssuer"].map((x) => AppointmentType.fromJson(x))),
        licenseDegree: List<AppointmentType>.from(json["licenseDegree"].map((x) => AppointmentType.fromJson(x))),
        sustainableMehwarPermit: List<dynamic>.from(json["sustainableMehwarPermit"].map((x) => x)),
        department: List<AppointmentType>.from(json["department"].map((x) => AppointmentType.fromJson(x))),
        tempMehwarPermit: List<dynamic>.from(json["tempMehwarPermit"].map((x) => x)),
        driverTipper: List<AppointmentType>.from(json["driverTipper"].map((x) => AppointmentType.fromJson(x))),
        insuranceCompany: List<AppointmentType>.from(json["insuranceCompany"].map((x) => AppointmentType.fromJson(x))),
        vehicleType: List<AppointmentType>.from(json["vehicleType"].map((x) => AppointmentType.fromJson(x))),
        attendanceStatus: List<AttendanceStatus>.from(json["attendanceStatus"].map((x) => AttendanceStatus.fromJson(x))),
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
        name: json["name"],
        id: json["id"],
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
    int wage;
    int? parentAttendanceStatusId;

    factory AttendanceStatus.fromJson(Map<dynamic, dynamic> json) => AttendanceStatus(
        attendanceStatusNameEn: json["attendanceStatusNameEn"],
        code: json["code"],
        isDeleted: json["isDeleted"],
        attendanceStatusNameAr: json["attendanceStatusNameAr"],
        id: json["id"],
        wage: json["wage"],
        parentAttendanceStatusId: json["parentAttendanceStatusId"],
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
    int defaultValue;
    String casualMissionTypeNameEn;
    int id;

    factory CasualMissionType.fromJson(Map<dynamic, dynamic> json) => CasualMissionType(
        casualMissionTypeNameAr: json["casualMissionTypeNameAr"],
        code: json["code"],
        isDeleted: json["isDeleted"],
        defaultDays: json["defaultDays"],
        defaultValue: json["defaultValue"],
        casualMissionTypeNameEn: json["casualMissionTypeNameEn"],
        id: json["id"],
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
