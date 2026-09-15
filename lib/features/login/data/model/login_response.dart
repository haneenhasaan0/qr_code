/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.expireDate,
        required this.privs,
        required this.accessToken,
        required this.userName,
        required this.message,
        required this.userId,
        required this.userCode,
        required this.refreshToken,
    });

    DateTime expireDate;
    List<Priv> privs;
    String accessToken;
    String userName;
    String message;
    String userId;
    int userCode;
    String refreshToken;

    factory LoginResponse.fromJson(Map<dynamic, dynamic> json) => LoginResponse(
        expireDate: DateTime.parse(json["expireDate"]),
        privs: List<Priv>.from(json["privs"].map((x) => Priv.fromJson(x))),
        accessToken: json["accessToken"],
        userName: json["userName"],
        message: json["message"],
        userId: json["userId"],
        userCode: json["userCode"],
        refreshToken: json["refreshToken"],
    );

    Map<dynamic, dynamic> toJson() => {
        "expireDate": expireDate.toIso8601String(),
        "privs": List<dynamic>.from(privs.map((x) => x.toJson())),
        "accessToken": accessToken,
        "userName": userName,
        "message": message,
        "userId": userId,
        "userCode": userCode,
        "refreshToken": refreshToken,
    };
}

class Priv {
    Priv({
        required this.pageNameEn,
        required this.actionIds,
        required this.appId,
        required this.id,
    });

    String pageNameEn;
    ActionIds actionIds;
    int appId;
    int id;

    factory Priv.fromJson(Map<dynamic, dynamic> json) => Priv(
        pageNameEn: json["pageNameEN"],
        actionIds: actionIdsValues.map[json["actionIds"]]!,
        appId: json["appId"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "pageNameEN": pageNameEn,
        "actionIds": actionIdsValues.reverse[actionIds],
        "appId": appId,
        "id": id,
    };
}

enum ActionIds { ACTION_ID_1_ACTION_ID_2_ACTION_ID_4, ACTION_ID_1_ACTION_ID_2, ACTION_ID_1 }

final actionIdsValues = EnumValues({
    "[{\"ActionID\":1}]": ActionIds.ACTION_ID_1,
    "[{\"ActionID\":1},{\"ActionID\":2}]": ActionIds.ACTION_ID_1_ACTION_ID_2,
    "[{\"ActionID\":1},{\"ActionID\":2},{\"ActionID\":4}]": ActionIds.ACTION_ID_1_ACTION_ID_2_ACTION_ID_4
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
