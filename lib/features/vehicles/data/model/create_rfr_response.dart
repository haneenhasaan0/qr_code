/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

CreateRfrResponse createRfrResponseFromJson(String str) => CreateRfrResponse.fromJson(json.decode(str));

String createRfrResponseToJson(CreateRfrResponse data) => json.encode(data.toJson());

class CreateRfrResponse {
    CreateRfrResponse({
        required this.data,
        required this.message,
    });

    List<Datum> data;
    String message;

    factory CreateRfrResponse.fromJson(Map<dynamic, dynamic> json) => CreateRfrResponse(
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
        required this.id,
        required this.serialNo,
    });

    int id;
    String serialNo;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        id: json["id"],
        serialNo: json["serialNo"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "serialNo": serialNo,
    };
}
