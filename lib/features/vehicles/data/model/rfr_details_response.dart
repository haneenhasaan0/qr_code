/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RfrDetailsResponse rfrDetailsResponseFromJson(String str) => RfrDetailsResponse.fromJson(json.decode(str));

String rfrDetailsResponseToJson(RfrDetailsResponse data) => json.encode(data.toJson());

class RfrDetailsResponse {
    RfrDetailsResponse({
        required this.data,
        required this.message,
    });

    List<Datum> data;
    String message;

    factory RfrDetailsResponse.fromJson(Map<dynamic, dynamic> json) => RfrDetailsResponse(
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
        required this.businessSector,
        required this.rfrList,
        required this.rfrVehicleStatus,
        required this.assetCategory,
        required this.rfrEquipmentStatus,
    });

    List<AssetCategory> businessSector;
    List<AssetCategory> rfrList;
    List<AssetCategory> rfrVehicleStatus;
    List<AssetCategory> assetCategory;
    List<AssetCategory> rfrEquipmentStatus;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        businessSector: List<AssetCategory>.from(json["businessSector"].map((x) => AssetCategory.fromJson(x))),
        rfrList: List<AssetCategory>.from(json["rfrList"].map((x) => AssetCategory.fromJson(x))),
        rfrVehicleStatus: List<AssetCategory>.from(json["rfrVehicleStatus"].map((x) => AssetCategory.fromJson(x))),
        assetCategory: List<AssetCategory>.from(json["assetCategory"].map((x) => AssetCategory.fromJson(x))),
        rfrEquipmentStatus: List<AssetCategory>.from(json["rfrEquipmentStatus"].map((x) => AssetCategory.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "businessSector": List<dynamic>.from(businessSector.map((x) => x.toJson())),
        "rfrList": List<dynamic>.from(rfrList.map((x) => x.toJson())),
        "rfrVehicleStatus": List<dynamic>.from(rfrVehicleStatus.map((x) => x.toJson())),
        "assetCategory": List<dynamic>.from(assetCategory.map((x) => x.toJson())),
        "rfrEquipmentStatus": List<dynamic>.from(rfrEquipmentStatus.map((x) => x.toJson())),
    };
}

class AssetCategory {
    AssetCategory({
        required this.name,
        required this.id,
    });

    String name;
    int id;

    factory AssetCategory.fromJson(Map<dynamic, dynamic> json) => AssetCategory(
        name: json["name"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
