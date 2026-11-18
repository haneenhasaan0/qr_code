/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

DriverDetailsReponse driverDetailsReponseFromJson(String str) => DriverDetailsReponse.fromJson(json.decode(str));


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

    factory DriverDetailsReponse.fromJson(
        Map<dynamic, dynamic> json,
        ) => DriverDetailsReponse(
        allRecords: int.tryParse(
            json['allRecords']?.toString() ?? '',
        ) ??
            0,
        accessToken: json['access_token']?.toString() ?? '',
        data: (json['data'] as List? ?? [])
            .map(
                (x) => Datum.fromJson(
                Map<dynamic, dynamic>.from(x as Map),
            ),
        )
            .toList(),
        message: json['message']?.toString() ?? '',
    );
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
        licenseNo: json["licenseNo"]?.toString() ?? "",
        insurancePolicyNo: json["insurancePolicyNo"]?.toString(),

        licenseDegreeId: int.tryParse(
            json["licenseDegreeId"]?.toString() ?? "",
        ) ??
            0,

        isTerminated: json["isTerminated"] is bool
            ? json["isTerminated"] as bool
            : false,

        modifiedAt: DateTime.tryParse(
            json["modifiedAt"]?.toString() ?? "",
        ) ??
            DateTime(2000),

        departmentId: int.tryParse(
            json["departmentId"]?.toString() ?? "",
        ),

        employeeNo: json["employeeNo"]?.toString() ?? "",

        fleetStaffId: int.tryParse(
            json["fleetStaffId"]?.toString() ?? "",
        ) ??
            0,

        licenseIssueDate: DateTime.tryParse(
            json["licenseIssueDate"]?.toString() ?? "",
        ) ??
            DateTime(2000),

        issuerId: int.tryParse(
            json["issuerId"]?.toString() ?? "",
        ) ??
            0,

        createdAt: DateTime.tryParse(
            json["createdAt"]?.toString() ?? "",
        ) ??
            DateTime(2000),

        companyNameAr: companyNameValues.map[json["companyNameAr"]],
        garageName: garageNameValues.map[json["garageName"]],

        businessSectorId: int.tryParse(
            json["businessSectorId"]?.toString() ?? "",
        ),

        companyNameEn: companyNameValues.map[json["companyNameEn"]],

        driverId: int.tryParse(
            json["driverId"]?.toString() ?? "",
        ) ??
            0,

        businessSectorNameEn:
        businessSectorNameEnValues.map[json["businessSectorNameEn"]],

        insuranceCompanyId: int.tryParse(
            json["insuranceCompanyId"]?.toString() ?? "",
        ),

        preferredLanguage:
        preferredLanguageValues.map[json["preferredLanguage"]] ??
            PreferredLanguage.EMPTY,

        garageId: int.tryParse(
            json["garageId"]?.toString() ?? "",
        ),

        businessSectorNameAr:
        businessSectorNameArValues.map[json["businessSectorNameAr"]],

        userCode: int.tryParse(
            json["userCode"]?.toString() ?? "",
        ),

        isDeleted: json["isDeleted"] is bool
            ? json["isDeleted"] as bool
            : false,

        modifiedBy: json["modifiedBy"]?.toString() ?? "",

        hasInternationalLicense:
        json["hasInternationalLicense"] is bool
            ? json["hasInternationalLicense"] as bool
            : false,

        address: json["address"]?.toString(),

        insuranceTypeId: int.tryParse(
            json["insuranceTypeId"]?.toString() ?? "",
        ),

        fullName: json["fullName"]?.toString() ?? "",

        typeNameAr: typeNameValues.map[json["typeNameAr"]],

        issuerNameAr:
        issuerNameValues.map[json["issuerNameAr"]] ?? IssuerName.DEFAULT,

        mobileNo: json["mobileNo"]?.toString() ?? "",

        userName: json["userName"]?.toString(),

        driverVehicleTypeJson: json["driverVehicleTypeJson"]?.toString(),

        typeNameEn: typeNameValues.map[json["typeNameEn"]],

        licenseExpiryDate: DateTime.tryParse(
            json["licenseExpiryDate"]?.toString() ?? "",
        ),

        issuerNameEn:
        issuerNameValues.map[json["issuerNameEn"]] ?? IssuerName.DEFAULT,

        nationalId: json["nationalId"]?.toString(),

        departmentNameEn:
        departmentNameEnValues.map[json["departmentNameEn"]],

        degreeNameEn:
        degreeNameValues.map[json["degreeNameEn"]] ?? DegreeName.PRIVATE,

        createdBy: json["createdBy"]?.toString() ?? "",

        departmentNameAr:
        departmentNameArValues.map[json["departmentNameAr"]],

        degreeNameAr:
        degreeNameValues.map[json["degreeNameAr"]] ?? DegreeName.PRIVATE,

        mobileNo2: json["mobileNo2"]?.toString(),

        notes: json["notes"]?.toString(),

        cardIdExpiryDate: DateTime.tryParse(
            json["cardIDExpiryDate"]?.toString() ?? "",
        ),

        trainingEndDate: DateTime.tryParse(
            json["trainingEndDate"]?.toString() ?? "",
        ),

        sustainableMehwarPermitDate: DateTime.tryParse(
            json["sustainableMehwarPermitDate"]?.toString() ?? "",
        ),

        dateAppointment: DateTime.tryParse(
            json["dateAppointment"]?.toString() ?? "",
        ),

        missionHeaderId: int.tryParse(
            json["missionHeaderId"]?.toString() ?? "",
        ),

        driverAttachementJson:
        json["driverAttachementJson"]?.toString(),

        appointmentTypeId: int.tryParse(
            json["appointmentTypeId"]?.toString() ?? "",
        ),

        missionCode: missionCodeValues.map[json["missionCode"]],

        terminatedDate: DateTime.tryParse(
            json["terminatedDate"]?.toString() ?? "",
        ),

        userEmail: json["userEmail"]?.toString(),

        roleCodeJson: json["roleCodeJson"]?.toString(),
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
        "birthDate": birthDate?.toIso8601String(),
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
