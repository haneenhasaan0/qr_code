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
    String actionIds;
    int appId;
    int id;

    factory Priv.fromJson(Map<dynamic, dynamic> json) => Priv(
        pageNameEn: json["pageNameEN"],
        actionIds: json["actionIds"],
        appId: json["appId"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "pageNameEN": pageNameEn,
        "actionIds": actionIds,
        "appId": appId,
        "id": id,
    };
}
