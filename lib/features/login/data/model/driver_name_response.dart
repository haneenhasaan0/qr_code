/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

DriverNameResponse driverNameResponseFromJson(String str) => DriverNameResponse.fromJson(json.decode(str));

String driverNameResponseToJson(DriverNameResponse data) => json.encode(data.toJson());

class DriverNameResponse {
    DriverNameResponse({
        required this.allRecords,
        required this.data,
        required this.message,
        required this.accessToken,
    });

    int allRecords;
    List<Datum> data;
    String message;
    String accessToken;

    factory DriverNameResponse.fromJson(Map<dynamic, dynamic> json) => DriverNameResponse(
        allRecords: json["allRecords"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        accessToken: json["accessToken"],
    );

    Map<dynamic, dynamic> toJson() => {
        "allRecords": allRecords,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "accessToken": accessToken,
    };
}

class Datum {
    Datum({
        required this.roleCodeJson,
        required this.id,
        required this.userName,
        required this.staffType,
        required this.userCode,
        required this.fleetStaffId,
        required this.fleetStaffName,
    });

    String? roleCodeJson;
    String? id;
    String? userName;
    int? staffType;
    int? userCode;
    int? fleetStaffId;
    String? fleetStaffName;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        roleCodeJson: json["roleCodeJson"],
        id: json["id"],
        userName: json["userName"],
        staffType: json["staffType"],
        userCode: json["userCode"],
        fleetStaffId: json["fleetStaffId"],
        fleetStaffName: json["fleetStaffName"],
    );

    Map<dynamic, dynamic> toJson() => {
        "roleCodeJson": roleCodeJson,
        "id": id,
        "userName": userName,
        "staffType": staffType,
        "userCode": userCode,
        "fleetStaffId": fleetStaffId,
        "fleetStaffName": fleetStaffName,
    };
}
