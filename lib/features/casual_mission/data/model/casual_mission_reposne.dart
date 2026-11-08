/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

CasualMissionReposne casualMissionReposneFromJson(String str) => CasualMissionReposne.fromJson(json.decode(str));

String casualMissionReposneToJson(CasualMissionReposne data) => json.encode(data.toJson());

class CasualMissionReposne {
    CasualMissionReposne({
        required this.allRecords,
        required this.data,
        required this.message,
    });

    int allRecords;
    List<dynamic> data;
    String message;

    factory CasualMissionReposne.fromJson(Map<dynamic, dynamic> json) => CasualMissionReposne(
        allRecords: json["allRecords"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        message: json["message"],
    );

    Map<dynamic, dynamic> toJson() => {
        "allRecords": allRecords,
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
    };
}
