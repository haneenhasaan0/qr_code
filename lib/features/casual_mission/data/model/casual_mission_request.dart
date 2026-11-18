import 'dart:convert';

class CasualMissionRequest {
    final DateTime fromDate;
    final DateTime toDate;
    final int businessSectorId;
    final List<CasualMissionItem> casualMissionJson;

    CasualMissionRequest({
        required this.fromDate,
        required this.toDate,
        required this.businessSectorId,
        required this.casualMissionJson,
    });

    Map<String, dynamic> toJson() => {
        "FromDate": fromDate.toIso8601String(),
        "ToDate": toDate.toIso8601String(),
        "BusinessSectorId": businessSectorId,
        "CasualMissionJson": jsonEncode(
            casualMissionJson.map((e) => e.toJson()).toList(),
        ),
    };
}

class CasualMissionItem {
    final int id;
    final int? driverId;
    final int? businessSectorId;
    final int? vehicleId;
    final int? casualMissionTypeId;
    final String notes;
    final int days;
    final num value;
    final num totalValue;
    final DateTime casualMissionDate;


    CasualMissionItem({
        required this.id,
        this.driverId,
        this.businessSectorId,
        this.vehicleId,
        this.casualMissionTypeId,
        required this.notes,
        required this.days,
        required this.value,
        required this.totalValue,
        required this.casualMissionDate,
    });

    Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverID": driverId,
        "BusinessSectorID": businessSectorId,
        "VehicleID": vehicleId,
        "CasualMissionTypeID": casualMissionTypeId,
        "Notes": notes,
        "Days": days,
        "Value": value,
        "TotalValue": totalValue,
        "CasualMissionDate": casualMissionDate.toIso8601String(),
    };
}