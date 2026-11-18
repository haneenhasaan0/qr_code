/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

CreateRfrRequest createRfrRequestFromJson(String str) => CreateRfrRequest.fromJson(json.decode(str));

String createRfrRequestToJson(CreateRfrRequest data) => json.encode(data.toJson());

class CreateRfrRequest {
    CreateRfrRequest({
        required this.vehicleKm,
        required this.rfrDescriptionJson,
        required this.driverId,
        required this.assetRfr,
        required this.projectId,
        required this.vehicleId,
        required this.businessSectorId,
        required this.trailerId,
        required this.rfrVehicleStatusId,
        required this.rfrEquipmentStatusId,
        required this.equipmentWorkingHrs,
        required this.locationControlRoom,
        this.description = "",
    });

    int vehicleKm;
    String rfrDescriptionJson;
    int driverId;
    int assetRfr;
    int projectId;
    int vehicleId;
    int businessSectorId;
    int trailerId;
    int rfrVehicleStatusId;
    int rfrEquipmentStatusId;
    int equipmentWorkingHrs;
    String locationControlRoom;
    String description;

    factory CreateRfrRequest.fromJson(Map<dynamic, dynamic> json) => CreateRfrRequest(
        vehicleKm: json["VehicleKm"],
        rfrDescriptionJson: json["RFRDescriptionJson"],
        driverId: json["DriverId"],
        assetRfr: json["AssetRFR"],
        projectId: json["ProjectId"],
        vehicleId: json["VehicleId"],
        businessSectorId: json["BusinessSectorId"],
        trailerId: json["TrailerId"],
        rfrVehicleStatusId: json["RFRVehicleStatusId"],
        rfrEquipmentStatusId: json["RFREquipmentStatusId"],
        equipmentWorkingHrs: json["EquipmentWorkingHrs"],
        locationControlRoom: json["LocationControlRoom"] ?? "",
        description: json["Description"] ?? "",
    );

    Map<dynamic, dynamic> toJson() => {
        "VehicleKm": vehicleKm,
        "RFRDescriptionJson": rfrDescriptionJson,
        "DriverId": driverId,
        "AssetRFR": assetRfr,
        "ProjectId": projectId,
        "VehicleId": vehicleId,
        "BusinessSectorId": businessSectorId,
        "TrailerId": trailerId,
        "RFRVehicleStatusId": rfrVehicleStatusId,
        "RFREquipmentStatusId": rfrEquipmentStatusId,
        "EquipmentWorkingHrs": equipmentWorkingHrs,
        "LocationControlRoom": locationControlRoom,
        "Description": description,
    };
}
