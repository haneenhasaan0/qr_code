/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RfrVehicleDetailsResponse rfrVehicleDetailsResponseFromJson(String str) => RfrVehicleDetailsResponse.fromJson(json.decode(str));

String rfrVehicleDetailsResponseToJson(RfrVehicleDetailsResponse data) => json.encode(data.toJson());

class RfrVehicleDetailsResponse {
    RfrVehicleDetailsResponse({
        required this.allRecords,
        required this.data,
        required this.message,
    });

    int allRecords;
    List<Datum> data;
    String message;

    factory RfrVehicleDetailsResponse.fromJson(Map<dynamic, dynamic> json) => RfrVehicleDetailsResponse(
        allRecords: json["allRecords"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<dynamic, dynamic> toJson() => {
        "allRecords": allRecords,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        this.vehicleTypeNameEn,
        this.rfrVehicleStatusNameAr,
        this.rfrVehicleStatusNameEn,
        this.rfrDescriptionJson,
        this.vehiclePlateNumber,
        this.trailerPlateNumber,
        this.vehicleKm,
        this.rfrVehicleStatusId,
        this.businessSectorNameEn,
        this.id,
        this.vehicleDepartmentNameEn,
        this.businessSectorId,
        this.vehicleCode,
        this.serialNo,
        this.locationControlRoom,
        this.driverId,
        this.driverName,
        this.rfrStatus,
        this.issuedDate,
        this.issuedBy,
        this.businessSectorNameAr,
        this.equipmentWorkingHrs,
        required this.isDeleted,
        this.vehicleId,
        this.assetRfr,
        this.vehicleDepartmentNameAr,
        this.vehicleTypeNameAr,
        this.trailerId,
        this.projectNameEn,
        this.projectNameAr,
        this.projectIdStr,
        this.cargoNameAr,
        this.projectId,
        this.cargoNameEn,
    });

    String? vehicleTypeNameEn;
    String? rfrVehicleStatusNameAr;
    String? rfrVehicleStatusNameEn;
    String? rfrDescriptionJson;
    String? vehiclePlateNumber;
    String? trailerPlateNumber;
    double? vehicleKm;
    int? rfrVehicleStatusId;
    String? businessSectorNameEn;
    int? id;
    String? vehicleDepartmentNameEn;
    int? businessSectorId;
    String? vehicleCode;
    String? serialNo;
    String? locationControlRoom;
    int? driverId;
    String? driverName;
    int? rfrStatus;
    DateTime? issuedDate;
    String? issuedBy;
    String? businessSectorNameAr;
    double? equipmentWorkingHrs;
    bool isDeleted;
    int? vehicleId;
    int? assetRfr;

    String? vehicleDepartmentNameAr;
    String? vehicleTypeNameAr;
    int? trailerId;
    String? projectNameEn;
    String? projectNameAr;
    String? projectIdStr;
    String? cargoNameAr;
    int? projectId;
    String? cargoNameEn;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        vehicleTypeNameEn: json["vehicleTypeNameEn"],

        vehiclePlateNumber: json['vehiclePlateNumber'] as String?,

        vehicleKm: (json['vehicleKm'] as num?)?.toDouble(),
        equipmentWorkingHrs:
        (json['equipmentWorkingHrs'] as num?)?.toDouble(),

        rfrVehicleStatusNameAr: json["rfrVehicleStatusNameAr"],
        rfrVehicleStatusNameEn: json["rfrVehicleStatusNameEn"],
        rfrDescriptionJson: json["rfrDescriptionJson"],
        trailerPlateNumber: json["trailerPlateNumber"],
        rfrVehicleStatusId: json["rfrVehicleStatusId"],
        businessSectorNameEn: json["businessSectorNameEN"],
        id: json["id"],
        vehicleDepartmentNameEn: json["vehicleDepartmentNameEn"],
        businessSectorId: json["businessSectorId"],
        vehicleCode: json["vehicleCode"],
        serialNo: json["serialNo"],
        locationControlRoom: json["locationControlRoom"],
        driverId: json["driverId"],
        driverName: json["driverName"],
        rfrStatus: json["rfrStatus"],
        issuedDate: json["issuedDate"] == null
            ? null
            : DateTime.tryParse(json["issuedDate"].toString()),
        issuedBy: json["issuedBy"],
        businessSectorNameAr: json["businessSectorNameAr"],
        isDeleted: json["isDeleted"],
        vehicleId: json["vehicleId"],
        assetRfr: json["assetRFR"],
        vehicleDepartmentNameAr: json["vehicleDepartmentNameAR"],
        vehicleTypeNameAr: json["vehicleTypeNameAr"],
        trailerId: json["trailerId"],
        projectNameEn: json["projectNameEn"],
        projectNameAr: json["projectNameAr"],
        projectIdStr: json["projectIDStr"],
        cargoNameAr: json["cargoNameAr"],
        projectId: json["projectId"],
        cargoNameEn: json["cargoNameEn"],
    );

    Map<dynamic, dynamic> toJson() => {
        "vehicleTypeNameEn": vehicleTypeNameEn,
        "rfrVehicleStatusNameAr": rfrVehicleStatusNameAr,
        "rfrVehicleStatusNameEn": rfrVehicleStatusNameEn,
        "rfrDescriptionJson": rfrDescriptionJson,
        "vehiclePlateNumber": vehiclePlateNumber,
        "trailerPlateNumber": trailerPlateNumber,
        "vehicleKm": vehicleKm,
        "rfrVehicleStatusId": rfrVehicleStatusId,
        "businessSectorNameEN": businessSectorNameEn,
        "id": id,
        "vehicleDepartmentNameEn": vehicleDepartmentNameEn,
        "businessSectorId": businessSectorId,
        "vehicleCode": vehicleCode,
        "serialNo": serialNo,
        "locationControlRoom": locationControlRoom,
        "driverId": driverId,
        "driverName": driverName,
        "rfrStatus": rfrStatus,
        "issuedDate": issuedDate?.toIso8601String(),
        "issuedBy": issuedBy,
        "businessSectorNameAr": businessSectorNameAr,
        "equipmentWorkingHrs": equipmentWorkingHrs,
        "isDeleted": isDeleted,
        "vehicleId": vehicleId,
        "assetRFR": assetRfr,
        "vehicleDepartmentNameAR": vehicleDepartmentNameAr,
        "vehicleTypeNameAr": vehicleTypeNameAr,
        "trailerId": trailerId,
        "projectNameEn": projectNameEn,
        "projectNameAr": projectNameAr,
        "projectIDStr": projectIdStr,
        "cargoNameAr": cargoNameAr,
        "projectId": projectId,
        "cargoNameEn": cargoNameEn,
    };
}
