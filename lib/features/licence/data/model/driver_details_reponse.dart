/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

DriverDetailsReponse driverDetailsReponseFromJson(String str) => DriverDetailsReponse.fromJson(json.decode(str));

String driverDetailsReponseToJson(DriverDetailsReponse data) => json.encode(data.toJson());

class DriverDetailsReponse {
    DriverDetailsReponse({
        required this.allRecords,
        required this.accessToken,
        required this.data,
        required this.message,
    });

    int allRecords;
    String accessToken;
    List<Datum> data;
    String message;

    factory DriverDetailsReponse.fromJson(Map<dynamic, dynamic> json) => DriverDetailsReponse(
        allRecords: json["allRecords"],
        accessToken: json["access_token"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<dynamic, dynamic> toJson() => {
        "allRecords": allRecords,
        "access_token": accessToken,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        this.licenseNo,
        this.insurancePolicyNo,
        required this.licenseDegreeId,
        required this.isTerminated,
        required this.modifiedAt,
        this.departmentId,
        required this.employeeNo,
        required this.fleetStaffId,
        required this.licenseIssueDate,
        required this.issuerId,
        required this.createdAt,
        this.companyNameAr,
        this.garageName,
        this.businessSectorId,
        this.companyNameEn,
        required this.driverId,
        this.businessSectorNameEn,
        this.insuranceCompanyId,
        required this.preferredLanguage,
        this.garageId,
        this.businessSectorNameAr,
        this.userCode,
        required this.isDeleted,
        required this.modifiedBy,
        required this.hasInternationalLicense,
        this.address,
        this.insuranceTypeId,
        required this.fullName,
        this.typeNameAr,
        required this.issuerNameAr,
        required this.mobileNo,
        this.userName,
        this.birthDate,
        this.driverVehicleTypeJson,
        this.typeNameEn,
        this.licenseExpiryDate,
        required this.issuerNameEn,
        this.nationalId,
        this.departmentNameEn,
        required this.degreeNameEn,
        required this.createdBy,
        this.departmentNameAr,
        required this.degreeNameAr,
        this.mobileNo2,
        this.notes,
        this.cardIdExpiryDate,
        this.trainingEndDate,
        this.sustainableMehwarPermitDate,
        this.dateAppointment,
        this.missionHeaderId,
        this.driverAttachementJson,
        this.appointmentTypeId,
        this.missionCode,
        this.terminatedDate,
        this.userEmail,
        this.roleCodeJson,
    });

    String? licenseNo;
    String? insurancePolicyNo;
    int licenseDegreeId;
    bool isTerminated;
    DateTime modifiedAt;
    int? departmentId;
    String employeeNo;
    int fleetStaffId;
    DateTime licenseIssueDate;
    int issuerId;
    DateTime createdAt;
    CompanyName? companyNameAr;
    GarageName? garageName;
    int? businessSectorId;
    CompanyName? companyNameEn;
    int driverId;
    BusinessSectorNameEn? businessSectorNameEn;
    int? insuranceCompanyId;
    PreferredLanguage preferredLanguage;
    int? garageId;
    BusinessSectorNameAr? businessSectorNameAr;
    int? userCode;
    bool isDeleted;
    String modifiedBy;
    bool hasInternationalLicense;
    String? address;
    int? insuranceTypeId;
    String fullName;
    TypeName? typeNameAr;
    IssuerName issuerNameAr;
    String mobileNo;
    String? userName;
    DateTime? birthDate;
    String? driverVehicleTypeJson;
    TypeName? typeNameEn;
    DateTime? licenseExpiryDate;
    IssuerName issuerNameEn;
    String? nationalId;
    DepartmentNameEn? departmentNameEn;
    DegreeName degreeNameEn;
    String createdBy;
    DepartmentNameAr? departmentNameAr;
    DegreeName degreeNameAr;
    String? mobileNo2;
    String? notes;
    DateTime? cardIdExpiryDate;
    DateTime? trainingEndDate;
    DateTime? sustainableMehwarPermitDate;
    DateTime? dateAppointment;
    int? missionHeaderId;
    String? driverAttachementJson;
    int? appointmentTypeId;
    MissionCode? missionCode;
    DateTime? terminatedDate;
    String? userEmail;
    String? roleCodeJson;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        licenseNo: json["licenseNo"],
        insurancePolicyNo: json["insurancePolicyNo"],
        licenseDegreeId: json["licenseDegreeId"],
        isTerminated: json["isTerminated"],
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        departmentId: json["departmentId"],
        employeeNo: json["employeeNo"],
        fleetStaffId: json["fleetStaffId"],
        licenseIssueDate: DateTime.parse(json["licenseIssueDate"]),
        issuerId: json["issuerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        companyNameAr: companyNameValues.map[json["companyNameAr"]]!,
        garageName: garageNameValues.map[json["garageName"]]!,
        businessSectorId: json["businessSectorId"],
        companyNameEn: companyNameValues.map[json["companyNameEn"]]!,
        driverId: json["driverId"],
        businessSectorNameEn: businessSectorNameEnValues.map[json["businessSectorNameEn"]]!,
        insuranceCompanyId: json["insuranceCompanyId"],
        preferredLanguage: preferredLanguageValues.map[json["preferredLanguage"]]!,
        garageId: json["garageId"],
        businessSectorNameAr: businessSectorNameArValues.map[json["businessSectorNameAr"]]!,
        userCode: json["userCode"],
        isDeleted: json["isDeleted"],
        modifiedBy: json["modifiedBy"],
        hasInternationalLicense: json["hasInternationalLicense"],
        address: json["address"],
        insuranceTypeId: json["insuranceTypeId"],
        fullName: json["fullName"],
        typeNameAr: typeNameValues.map[json["typeNameAr"]]!,
        issuerNameAr: issuerNameValues.map[json["issuerNameAr"]]!,
        mobileNo: json["mobileNo"],
        userName: json["userName"],
        birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
        driverVehicleTypeJson: json["driverVehicleTypeJson"],
        typeNameEn: typeNameValues.map[json["typeNameEn"]]!,
        licenseExpiryDate: json["licenseExpiryDate"] == null ? null : DateTime.parse(json["licenseExpiryDate"]),
        issuerNameEn: issuerNameValues.map[json["issuerNameEn"]]!,
        nationalId: json["nationalId"],
        departmentNameEn: departmentNameEnValues.map[json["departmentNameEn"]]!,
        degreeNameEn: degreeNameValues.map[json["degreeNameEn"]]!,
        createdBy: json["createdBy"],
        departmentNameAr: departmentNameArValues.map[json["departmentNameAr"]]!,
        degreeNameAr: degreeNameValues.map[json["degreeNameAr"]]!,
        mobileNo2: json["mobileNo2"],
        notes: json["notes"],
        cardIdExpiryDate: json["cardIDExpiryDate"] == null ? null : DateTime.parse(json["cardIDExpiryDate"]),
        trainingEndDate: json["trainingEndDate"] == null ? null : DateTime.parse(json["trainingEndDate"]),
        sustainableMehwarPermitDate: json["sustainableMehwarPermitDate"] == null ? null : DateTime.parse(json["sustainableMehwarPermitDate"]),
        dateAppointment: json["dateAppointment"] == null ? null : DateTime.parse(json["dateAppointment"]),
        missionHeaderId: json["missionHeaderId"],
        driverAttachementJson: json["driverAttachementJson"],
        appointmentTypeId: json["appointmentTypeId"],
        missionCode: missionCodeValues.map[json["missionCode"]]!,
        terminatedDate: json["terminatedDate"] == null ? null : DateTime.parse(json["terminatedDate"]),
        userEmail: json["userEmail"],
        roleCodeJson: json["roleCodeJson"],
    );

    Map<dynamic, dynamic> toJson() => {
        "licenseNo": licenseNo,
        "insurancePolicyNo": insurancePolicyNo,
        "licenseDegreeId": licenseDegreeId,
        "isTerminated": isTerminated,
        "modifiedAt": modifiedAt.toIso8601String(),
        "departmentId": departmentId,
        "employeeNo": employeeNo,
        "fleetStaffId": fleetStaffId,
        "licenseIssueDate": "${licenseIssueDate.year.toString().padLeft(4, '0')}-${licenseIssueDate.month.toString().padLeft(2, '0')}-${licenseIssueDate.day.toString().padLeft(2, '0')}",
        "issuerId": issuerId,
        "createdAt": createdAt.toIso8601String(),
        "companyNameAr": companyNameValues.reverse[companyNameAr],
        "garageName": garageNameValues.reverse[garageName],
        "businessSectorId": businessSectorId,
        "companyNameEn": companyNameValues.reverse[companyNameEn],
        "driverId": driverId,
        "businessSectorNameEn": businessSectorNameEnValues.reverse[businessSectorNameEn],
        "insuranceCompanyId": insuranceCompanyId,
        "preferredLanguage": preferredLanguageValues.reverse[preferredLanguage],
        "garageId": garageId,
        "businessSectorNameAr": businessSectorNameArValues.reverse[businessSectorNameAr],
        "userCode": userCode,
        "isDeleted": isDeleted,
        "modifiedBy": modifiedBy,
        "hasInternationalLicense": hasInternationalLicense,
        "address": address,
        "insuranceTypeId": insuranceTypeId,
        "fullName": fullName,
        "typeNameAr": typeNameValues.reverse[typeNameAr],
        "issuerNameAr": issuerNameValues.reverse[issuerNameAr],
        "mobileNo": mobileNo,
        "userName": userName,
        "birthDate": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "driverVehicleTypeJson": driverVehicleTypeJson,
        "typeNameEn": typeNameValues.reverse[typeNameEn],
        "licenseExpiryDate": "${licenseExpiryDate!.year.toString().padLeft(4, '0')}-${licenseExpiryDate!.month.toString().padLeft(2, '0')}-${licenseExpiryDate!.day.toString().padLeft(2, '0')}",
        "issuerNameEn": issuerNameValues.reverse[issuerNameEn],
        "nationalId": nationalId,
        "departmentNameEn": departmentNameEnValues.reverse[departmentNameEn],
        "degreeNameEn": degreeNameValues.reverse[degreeNameEn],
        "createdBy": createdBy,
        "departmentNameAr": departmentNameArValues.reverse[departmentNameAr],
        "degreeNameAr": degreeNameValues.reverse[degreeNameAr],
        "mobileNo2": mobileNo2,
        "notes": notes,
        "cardIDExpiryDate": cardIdExpiryDate?.toIso8601String(),
        "trainingEndDate": trainingEndDate?.toIso8601String(),
        "sustainableMehwarPermitDate": sustainableMehwarPermitDate?.toIso8601String(),
        "dateAppointment": dateAppointment?.toIso8601String(),
        "missionHeaderId": missionHeaderId,
        "driverAttachementJson": driverAttachementJson,
        "appointmentTypeId": appointmentTypeId,
        "missionCode": missionCodeValues.reverse[missionCode],
        "terminatedDate": "${terminatedDate!.year.toString().padLeft(4, '0')}-${terminatedDate!.month.toString().padLeft(2, '0')}-${terminatedDate!.day.toString().padLeft(2, '0')}",
        "userEmail": userEmail,
        "roleCodeJson": roleCodeJson,
    };
}

enum BusinessSectorNameAr { EMPTY, BUSINESS_SECTOR_NAME_AR, PURPLE }

final businessSectorNameArValues = EnumValues({
    "السلع": BusinessSectorNameAr.BUSINESS_SECTOR_NAME_AR,
    "البترول": BusinessSectorNameAr.EMPTY,
    "خدمات سكاى": BusinessSectorNameAr.PURPLE
});

enum BusinessSectorNameEn { OIL_GAS, TRANSPORTATION, SKY_SERVICES }

final businessSectorNameEnValues = EnumValues({
    "Oil&Gas": BusinessSectorNameEn.OIL_GAS,
    "Sky Services": BusinessSectorNameEn.SKY_SERVICES,
    "Transportation": BusinessSectorNameEn.TRANSPORTATION
});

enum CompanyName { MEDNET_GENERAL_INSURANCE }

final companyNameValues = EnumValues({
    "Mednet General Insurance": CompanyName.MEDNET_GENERAL_INSURANCE
});

enum DegreeName { PRIVATE, SECOND_DEGREE, FIRST_DEGREE, SECOND_CLASS, FIRST_CLASS }

final degreeNameValues = EnumValues({
    "First Class": DegreeName.FIRST_CLASS,
    "First Degree": DegreeName.FIRST_DEGREE,
    "Private": DegreeName.PRIVATE,
    "Second Class": DegreeName.SECOND_CLASS,
    "Second Degree": DegreeName.SECOND_DEGREE
});

enum DepartmentNameAr { EMPTY, DEPARTMENT_NAME_AR }

final departmentNameArValues = EnumValues({
    "المشتريات": DepartmentNameAr.DEPARTMENT_NAME_AR,
    "التشغيل": DepartmentNameAr.EMPTY
});

enum DepartmentNameEn { OPERATION, PURCHASING }

final departmentNameEnValues = EnumValues({
    "Operation": DepartmentNameEn.OPERATION,
    "Purchasing": DepartmentNameEn.PURCHASING
});

enum GarageName { DEFAULT, ALEX_YARD, MONEB_YARD }

final garageNameValues = EnumValues({
    "Alex Yard": GarageName.ALEX_YARD,
    "Default": GarageName.DEFAULT,
    "Moneb Yard": GarageName.MONEB_YARD
});

enum IssuerName { DEFAULT, SKY_LOGISTICS }

final issuerNameValues = EnumValues({
    "Default": IssuerName.DEFAULT,
    "Sky Logistics": IssuerName.SKY_LOGISTICS
});

enum MissionCode { MP_00595226 }

final missionCodeValues = EnumValues({
    "MP--005952-26": MissionCode.MP_00595226
});

enum PreferredLanguage { EN, EMPTY }

final preferredLanguageValues = EnumValues({
    "": PreferredLanguage.EMPTY,
    "en": PreferredLanguage.EN
});

enum TypeName { MEDICAL, FULL }

final typeNameValues = EnumValues({
    "Full": TypeName.FULL,
    "Medical": TypeName.MEDICAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
