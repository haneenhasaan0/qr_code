import 'dart:convert';

VehicleDetailsResponse vehicleDetailsResponseFromJson(String str) => VehicleDetailsResponse.fromJson(json.decode(str));

String vehicleDetailsResponseToJson(VehicleDetailsResponse data) => json.encode(data.toJson());

class VehicleDetailsResponse {
    VehicleDetailsResponse({
        required this.allRecords,
        required this.accessToken,
        required this.data,
        required this.message,
    });

    int allRecords;
    String accessToken;
    List<Datum> data;
    String message;

    factory VehicleDetailsResponse.fromJson(Map<dynamic, dynamic> json) => VehicleDetailsResponse(
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
        this.acquisitionDate,
        required this.cylinderCount,
        required this.year,
        required this.modifiedAt,
        required this.departmentId,
        required this.transmissionNameEn,
        required this.utilityTypeNameAr,
        this.unitTypeNameAr,
        this.tankSize,
        required this.licenseIssueDate,
        required this.createdAt,
        required this.bodyTypeNameEn,
        required this.licensePlate,
        required this.isCommercialVehicle,
        required this.licenseIssuerId,
        this.fuelConsumptionRate,
        required this.bodyTypeNameAr,
        required this.isMobileWorkshop,
        this.odometer,
        required this.vehicleBrandNameAr,
        required this.garageName,
        required this.businessSectorId,
        required this.vehicleCode,
        this.handheldSerial,
        this.chassisNumber,
        this.suspensionNameEn,
        required this.transmissionNameAr,
        required this.isSold,
        required this.businessSectorNameEn,
        required this.brandId,
        this.suspensionNameAr,
        required this.vehicleBrandNameEn,
        required this.vehicleTypeId,
        this.unitTypeId,
        this.suspensionTypeId,
        required this.attachedTrailer,
        required this.garageId,
        this.axleConfigId,
        required this.utilityTypeId,
        required this.businessSectorNameAr,
        this.capacity,
        this.missionHeaderId,
        required this.isDeleted,
        required this.vinNumber,
        required this.assetId,
        this.isDisposed,
        required this.modifiedBy,
        required this.vehicleId,
        this.axfixedAssetCode,
        required this.transmissionTypeId,
        this.vehiclePmGroupJson,
        this.unitTypeNameEn,
        this.vehicleFuelTypeJson,
        required this.engineNumber,
        required this.licenseExpiryDate,
        this.axleConfigNameAr,
        this.missionCode,
        this.utilityTypeNameEn,
        required this.departmentNameEn,
        required this.createdBy,
        this.axleConfigNameEn,
        required this.departmentNameAr,
        this.originalOdometer,
        this.soldDate,
        this.disposedDate,
    });

    DateTime? acquisitionDate;
    int cylinderCount;
    int year;
    DateTime modifiedAt;
    int departmentId;
    TransmissionNameEn transmissionNameEn;
    UtilityTypeNameAr utilityTypeNameAr;
    UnitTypeName? unitTypeNameAr;
    int? tankSize;
    DateTime licenseIssueDate;
    DateTime createdAt;
    BodyTypeNameEn bodyTypeNameEn;
    String licensePlate;
    bool isCommercialVehicle;
    int licenseIssuerId;
    double? fuelConsumptionRate;
    BodyTypeNameAr bodyTypeNameAr;
    bool isMobileWorkshop;
    int? odometer;
    String vehicleBrandNameAr;
    GarageName garageName;
    int businessSectorId;
    String vehicleCode;
    String? handheldSerial;
    String? chassisNumber;
    SuspensionName? suspensionNameEn;
    TransmissionNameAr transmissionNameAr;
    bool isSold;
    BusinessSectorNameEn businessSectorNameEn;
    int brandId;
    SuspensionName? suspensionNameAr;
    String vehicleBrandNameEn;
    int vehicleTypeId;
    int? unitTypeId;
    int? suspensionTypeId;
    bool attachedTrailer;
    int garageId;
    int? axleConfigId;
    int utilityTypeId;
    BusinessSectorNameAr businessSectorNameAr;
    int? capacity;
    int? missionHeaderId;
    bool isDeleted;
    String vinNumber;
    int assetId;
    bool? isDisposed;
    String modifiedBy;
    int vehicleId;
    String? axfixedAssetCode;
    int transmissionTypeId;
    String? vehiclePmGroupJson;
    UnitTypeName? unitTypeNameEn;
    VehicleFuelTypeJson? vehicleFuelTypeJson;
    String engineNumber;
    DateTime licenseExpiryDate;
    AxleConfigName? axleConfigNameAr;
    MissionCode? missionCode;
    UtilityTypeNameEn? utilityTypeNameEn;
    DepartmentNameEn departmentNameEn;
    CreatedBy createdBy;
    AxleConfigName? axleConfigNameEn;
    DepartmentNameAr departmentNameAr;
    int? originalOdometer;
    DateTime? soldDate;
    DateTime? disposedDate;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        acquisitionDate: json["acquisitionDate"] == null ? null : DateTime.parse(json["acquisitionDate"]),
        cylinderCount: json["cylinderCount"],
        year: json["year"],
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        departmentId: json["departmentId"],
        transmissionNameEn: transmissionNameEnValues.map[json["transmissionNameEn"]]!,
        utilityTypeNameAr: utilityTypeNameArValues.map[json["utilityTypeNameAr"]]!,
        unitTypeNameAr: unitTypeNameValues.map[json["unitTypeNameAr"]],
        licenseIssueDate: DateTime.parse(json["licenseIssueDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        bodyTypeNameEn: bodyTypeNameEnValues.map[json["bodyTypeNameEn"]]!,
        licensePlate: json["licensePlate"],
        isCommercialVehicle: json["isCommercialVehicle"],
        licenseIssuerId: json["licenseIssuerId"],
        fuelConsumptionRate: json["fuelConsumptionRate"]?.toDouble(),
        bodyTypeNameAr: bodyTypeNameArValues.map[json["bodyTypeNameAr"]]!,
        isMobileWorkshop: json["isMobileWorkshop"],
        tankSize: (json["tankSize"] as num?)?.toInt(),
        odometer: (json["odometer"] as num?)?.toInt(),
        vehicleBrandNameAr: json["vehicleBrandNameAr"],
        garageName: garageNameValues.map[json["garageName"]]!,
        businessSectorId: json["businessSectorId"],
        vehicleCode: json["vehicleCode"],
        handheldSerial: json["handheldSerial"],
        chassisNumber: json["chassisNumber"],
        suspensionNameEn: suspensionNameValues.map[json["suspensionNameEn"]],
        transmissionNameAr: transmissionNameArValues.map[json["transmissionNameAr"]]!,
        isSold: json["isSold"],
        businessSectorNameEn: businessSectorNameEnValues.map[json["businessSectorNameEn"]]!,
        brandId: json["brandId"],
        suspensionNameAr: suspensionNameValues.map[json["suspensionNameAr"]],
        vehicleBrandNameEn: json["vehicleBrandNameEn"],
        vehicleTypeId: json["vehicleTypeId"],
        unitTypeId: json["unitTypeId"],
        suspensionTypeId: json["suspensionTypeId"],
        attachedTrailer: json["attachedTrailer"],
        garageId: json["garageId"],
        axleConfigId: json["axleConfigId"],
        utilityTypeId: json["utilityTypeId"],
        businessSectorNameAr: businessSectorNameArValues.map[json["businessSectorNameAr"]]!,
        capacity: (json["capacity"] as num?)?.toInt(),
        missionHeaderId: json["missionHeaderId"],
        isDeleted: json["isDeleted"],
        vinNumber: json["vinNumber"],
        assetId: json["assetId"],
        isDisposed: json["isDisposed"],
        modifiedBy: json["modifiedBy"],
        vehicleId: json["vehicleId"],
        axfixedAssetCode: json["axfixedAssetCode"],
        transmissionTypeId: json["transmissionTypeId"],
        vehiclePmGroupJson: json["vehiclePMGroupJson"],
        unitTypeNameEn: unitTypeNameValues.map[json["unitTypeNameEN"]],
        vehicleFuelTypeJson: vehicleFuelTypeJsonValues.map[json["vehicleFuelTypeJson"]],
        engineNumber: json["engineNumber"],
        licenseExpiryDate: DateTime.parse(json["licenseExpiryDate"]),
        axleConfigNameAr: axleConfigNameValues.map[json["axleConfigNameAr"]],
        missionCode: missionCodeValues.map[json["missionCode"]],
        utilityTypeNameEn: utilityTypeNameEnValues.map[json["utilityTypeNameEn"]],
        departmentNameEn: departmentNameEnValues.map[json["departmentNameEn"]]!,
        createdBy: createdByValues.map[json["createdBy"]]!,
        axleConfigNameEn: axleConfigNameValues.map[json["axleConfigNameEn"]],
        departmentNameAr: departmentNameArValues.map[json["departmentNameAr"]]!,
        originalOdometer: (json["originalOdometer"] as num?)?.toInt(),

        soldDate: json["soldDate"] == null ? null : DateTime.parse(json["soldDate"]),
        disposedDate: json["disposedDate"] == null ? null : DateTime.parse(json["disposedDate"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "acquisitionDate": "${acquisitionDate!.year.toString().padLeft(4, '0')}-${acquisitionDate!.month.toString().padLeft(2, '0')}-${acquisitionDate!.day.toString().padLeft(2, '0')}",
        "cylinderCount": cylinderCount,
        "year": year,
        "modifiedAt": modifiedAt.toIso8601String(),
        "departmentId": departmentId,
        "transmissionNameEn": transmissionNameEnValues.reverse[transmissionNameEn],
        "utilityTypeNameAr": utilityTypeNameArValues.reverse[utilityTypeNameAr],
        "unitTypeNameAr": unitTypeNameValues.reverse[unitTypeNameAr],
        "tankSize": tankSize,
        "licenseIssueDate": "${licenseIssueDate.year.toString().padLeft(4, '0')}-${licenseIssueDate.month.toString().padLeft(2, '0')}-${licenseIssueDate.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt.toIso8601String(),
        "bodyTypeNameEn": bodyTypeNameEnValues.reverse[bodyTypeNameEn],
        "licensePlate": licensePlate,
        "isCommercialVehicle": isCommercialVehicle,
        "licenseIssuerId": licenseIssuerId,
        "fuelConsumptionRate": fuelConsumptionRate,
        "bodyTypeNameAr": bodyTypeNameArValues.reverse[bodyTypeNameAr],
        "isMobileWorkshop": isMobileWorkshop,
        "odometer": odometer,
        "vehicleBrandNameAr": vehicleBrandNameAr,
        "garageName": garageNameValues.reverse[garageName],
        "businessSectorId": businessSectorId,
        "vehicleCode": vehicleCode,
        "handheldSerial": handheldSerial,
        "chassisNumber": chassisNumber,
        "suspensionNameEn": suspensionNameValues.reverse[suspensionNameEn],
        "transmissionNameAr": transmissionNameArValues.reverse[transmissionNameAr],
        "isSold": isSold,
        "businessSectorNameEn": businessSectorNameEnValues.reverse[businessSectorNameEn],
        "brandId": brandId,
        "suspensionNameAr": suspensionNameValues.reverse[suspensionNameAr],
        "vehicleBrandNameEn": vehicleBrandNameEn,
        "vehicleTypeId": vehicleTypeId,
        "unitTypeId": unitTypeId,
        "suspensionTypeId": suspensionTypeId,
        "attachedTrailer": attachedTrailer,
        "garageId": garageId,
        "axleConfigId": axleConfigId,
        "utilityTypeId": utilityTypeId,
        "businessSectorNameAr": businessSectorNameArValues.reverse[businessSectorNameAr],
        "capacity": capacity,
        "missionHeaderId": missionHeaderId,
        "isDeleted": isDeleted,
        "vinNumber": vinNumber,
        "assetId": assetId,
        "isDisposed": isDisposed,
        "modifiedBy": modifiedBy,
        "vehicleId": vehicleId,
        "axfixedAssetCode": axfixedAssetCode,
        "transmissionTypeId": transmissionTypeId,
        "vehiclePMGroupJson": vehiclePmGroupJson,
        "unitTypeNameEN": unitTypeNameValues.reverse[unitTypeNameEn],
        "vehicleFuelTypeJson": vehicleFuelTypeJsonValues.reverse[vehicleFuelTypeJson],
        "engineNumber": engineNumber,
        "licenseExpiryDate": "${licenseExpiryDate.year.toString().padLeft(4, '0')}-${licenseExpiryDate.month.toString().padLeft(2, '0')}-${licenseExpiryDate.day.toString().padLeft(2, '0')}",
        "axleConfigNameAr": axleConfigNameValues.reverse[axleConfigNameAr],
        "missionCode": missionCodeValues.reverse[missionCode],
        "utilityTypeNameEn": utilityTypeNameEnValues.reverse[utilityTypeNameEn],
        "departmentNameEn": departmentNameEnValues.reverse[departmentNameEn],
        "createdBy": createdByValues.reverse[createdBy],
        "axleConfigNameEn": axleConfigNameValues.reverse[axleConfigNameEn],
        "departmentNameAr": departmentNameArValues.reverse[departmentNameAr],
        "originalOdometer": originalOdometer,
        "soldDate": "${soldDate!.year.toString().padLeft(4, '0')}-${soldDate!.month.toString().padLeft(2, '0')}-${soldDate!.day.toString().padLeft(2, '0')}",
        "disposedDate": "${disposedDate!.year.toString().padLeft(4, '0')}-${disposedDate!.month.toString().padLeft(2, '0')}-${disposedDate!.day.toString().padLeft(2, '0')}",
    };
}

enum AxleConfigName { THE_64, THE_42, THE_62, DEFAULT }

final axleConfigNameValues = EnumValues({
    "Default": AxleConfigName.DEFAULT,
    "4*2": AxleConfigName.THE_42,
    "6*2": AxleConfigName.THE_62,
    "6*4": AxleConfigName.THE_64
});

enum BodyTypeNameAr { TRUCK, LIGHT_VECHILE, EMPTY }

final bodyTypeNameArValues = EnumValues({
    "ونش": BodyTypeNameAr.EMPTY,
    "Light Vechile": BodyTypeNameAr.LIGHT_VECHILE,
    "Truck": BodyTypeNameAr.TRUCK
});

enum BodyTypeNameEn { TRUCK, LIGHT_VECHILE, CRANE }

final bodyTypeNameEnValues = EnumValues({
    "Crane": BodyTypeNameEn.CRANE,
    "Light Vechile": BodyTypeNameEn.LIGHT_VECHILE,
    "Truck": BodyTypeNameEn.TRUCK
});

enum BusinessSectorNameAr { EMPTY, BUSINESS_SECTOR_NAME_AR, PURPLE }

final businessSectorNameArValues = EnumValues({
    "البترول": BusinessSectorNameAr.BUSINESS_SECTOR_NAME_AR,
    "السلع": BusinessSectorNameAr.EMPTY,
    "خدمات سكاى": BusinessSectorNameAr.PURPLE
});

enum BusinessSectorNameEn { TRANSPORTATION, OIL_GAS, SKY_SERVICES }

final businessSectorNameEnValues = EnumValues({
    "Oil&Gas": BusinessSectorNameEn.OIL_GAS,
    "Sky Services": BusinessSectorNameEn.SKY_SERVICES,
    "Transportation": BusinessSectorNameEn.TRANSPORTATION
});

enum CreatedBy { SYSTEM }

final createdByValues = EnumValues({
    "System": CreatedBy.SYSTEM
});

enum DepartmentNameAr { EMPTY, DEPARTMENT_NAME_AR, PURPLE, FLUFFY }

final departmentNameArValues = EnumValues({
    "الأدارية": DepartmentNameAr.DEPARTMENT_NAME_AR,
    "التشغيل": DepartmentNameAr.EMPTY,
    "الصيانه": DepartmentNameAr.FLUFFY,
    "المشتريات": DepartmentNameAr.PURPLE
});

enum DepartmentNameEn { OPERATION, ADMINISTRATION, PURCHASING, MAINTENANCE }

final departmentNameEnValues = EnumValues({
    "Administration": DepartmentNameEn.ADMINISTRATION,
    "Maintenance": DepartmentNameEn.MAINTENANCE,
    "Operation": DepartmentNameEn.OPERATION,
    "Purchasing": DepartmentNameEn.PURCHASING
});

enum GarageName { SUEZ_YARD, MONEB_YARD, ALEX_YARD }

final garageNameValues = EnumValues({
    "Alex Yard": GarageName.ALEX_YARD,
    "Moneb Yard": GarageName.MONEB_YARD,
    "Suez Yard": GarageName.SUEZ_YARD
});

enum MissionCode { MP_00595226 }

final missionCodeValues = EnumValues({
    "MP--005952-26": MissionCode.MP_00595226
});

enum SuspensionName { STEEL, AIR, DEFAULT }

final suspensionNameValues = EnumValues({
    "Air": SuspensionName.AIR,
    "Default": SuspensionName.DEFAULT,
    "Steel": SuspensionName.STEEL
});

enum TransmissionNameAr { EMPTY, TRANSMISSION_NAME_AR }

final transmissionNameArValues = EnumValues({
    "مانوال": TransmissionNameAr.EMPTY,
    "اوتوماتك": TransmissionNameAr.TRANSMISSION_NAME_AR
});

enum TransmissionNameEn { MANUAL, AUTOMATIC }

final transmissionNameEnValues = EnumValues({
    "Automatic": TransmissionNameEn.AUTOMATIC,
    "Manual": TransmissionNameEn.MANUAL
});

enum UnitTypeName { HEAVY_TRUCK, JUMBO, DOUBLE_CABIN, SINGLE_CABIN, TELESCOPIC_CRANE }

final unitTypeNameValues = EnumValues({
    "Double Cabin": UnitTypeName.DOUBLE_CABIN,
    "Heavy truck": UnitTypeName.HEAVY_TRUCK,
    "Jumbo": UnitTypeName.JUMBO,
    "Single Cabin": UnitTypeName.SINGLE_CABIN,
    "Telescopic  Crane": UnitTypeName.TELESCOPIC_CRANE
});

enum UtilityTypeNameAr { EMPTY, UTILITY_TYPE_NAME_AR }

final utilityTypeNameArValues = EnumValues({
    "مباشر": UtilityTypeNameAr.EMPTY,
    "غير مباشر": UtilityTypeNameAr.UTILITY_TYPE_NAME_AR
});

enum UtilityTypeNameEn { DIRECT, INDIRECT }

final utilityTypeNameEnValues = EnumValues({
    "Direct": UtilityTypeNameEn.DIRECT,
    "Indirect": UtilityTypeNameEn.INDIRECT
});

enum VehicleFuelTypeJson { FUEL_TYPE_ID_137 }

final vehicleFuelTypeJsonValues = EnumValues({
    "[{\"FuelTypeId\":137}]": VehicleFuelTypeJson.FUEL_TYPE_ID_137
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
