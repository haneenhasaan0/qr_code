/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

CasualMissiomRequest casualMissiomRequestFromJson(String str) => CasualMissiomRequest.fromJson(json.decode(str));

String casualMissiomRequestToJson(CasualMissiomRequest data) => json.encode(data.toJson());

class CasualMissiomRequest {
    CasualMissiomRequest({
        required this.fromDate,
        required this.toDate,
        required this.businessSectorId,
    });

    DateTime fromDate;
    DateTime toDate;
    int businessSectorId;

    factory CasualMissiomRequest.fromJson(Map<dynamic, dynamic> json) => CasualMissiomRequest(
        fromDate: DateTime.parse(json["FromDate"]),
        toDate: DateTime.parse(json["ToDate"]),
        businessSectorId: json["BusinessSectorId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "FromDate": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "ToDate": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "BusinessSectorId": businessSectorId,
    };
}
