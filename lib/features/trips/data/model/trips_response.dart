/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

TripsResponse tripsResponseFromJson(String str) => TripsResponse.fromJson(json.decode(str));

String tripsResponseToJson(TripsResponse data) => json.encode(data.toJson());

class TripsResponse {
    TripsResponse({
        required this.allRecords,
        required this.data,
        required this.message,
    });

    int allRecords;
    List<Datum> data;
    String message;

    factory TripsResponse.fromJson(Map<dynamic, dynamic> json) => TripsResponse(
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
        required this.salesOrderId,
        required this.projectNameEn,
        required this.modifiedAt,
        required this.tripId,
        this.isDvApproved,
        required this.businessSectorNameAr,
        required this.vehiclePlateNumber,
        required this.createdAt,
        required this.tripStatusAr,
        required this.trailerPlateNumber,
        required this.statusGroupAr,
        required this.isDeleted,
        required this.tripName,
        required this.modifiedBy,
        this.isRepApproved,
        this.projectNameAr,
        required this.statusGroup,
        required this.projectIdStr,
        required this.createdBy,
        required this.businessSectorNameEn,
        this.isAccApproved,
        this.custodyNo,
        required this.driverName,
        this.startDate,
        required this.pageClassify,
        required this.tripStatus,
        this.handHeldCode,
        this.journalBatchNumber,
        this.packingSlip,
    });

    DateTime modifiedAt;
    int tripId;
    bool? isDvApproved;
    String vehiclePlateNumber;
    DateTime createdAt;
    String trailerPlateNumber;
    bool isDeleted;
    String tripName;
    bool? isRepApproved;
    bool? isAccApproved;
    String? custodyNo;
    String? driverName;
    DateTime? startDate;
    int pageClassify;
    String? handHeldCode;
    String? journalBatchNumber;
    String? packingSlip;
    String? salesOrderId;
    String projectNameEn;
    String? projectNameAr;
    String businessSectorNameAr;
    String businessSectorNameEn;
    String tripStatusAr;
    String statusGroupAr;
    String statusGroup;
    String projectIdStr;
    String createdBy;
    String modifiedBy;
    String tripStatus;
    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        salesOrderId:  json["salesOrderId"]??"",
        projectNameEn: json["projectNameEn"]??"",
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        tripId: json["tripId"],
        isDvApproved: json["isDVApproved"],
        businessSectorNameAr:json["businessSectorNameAr"]??"",
        vehiclePlateNumber: json["vehiclePlateNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
        tripStatusAr:json["tripStatusAr"]??"",
        trailerPlateNumber: json["trailerPlateNumber"]??"",
        statusGroupAr:json["statusGroupAr"]??"",
        isDeleted: json["isDeleted"],
        tripName: json["tripName"],
        modifiedBy: json["modifiedBy"]??"",
        isRepApproved: json["isRepApproved"],
        projectNameAr:json["projectNameAr"]??"",
        statusGroup: json["statusGroup"]??"",
        projectIdStr: json["projectIDStr"]??"",
        createdBy: json["createdBy"]??"",
        businessSectorNameEn: json["businessSectorNameEn"]??"",
        isAccApproved: json["isAccApproved"],
        custodyNo: json["custodyNo"],
        driverName: json["driverName"]??"",
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        pageClassify: json["pageClassify"],
        tripStatus: json["tripStatus"]??"",
        handHeldCode: json["handHeldCode"],
        journalBatchNumber: json["journalBatchNumber"],
        packingSlip: json["packingSlip"],
    );

    Map<dynamic, dynamic> toJson() => {
        "salesOrderId": salesOrderIdValues.reverse[salesOrderId],
        "projectNameEn": projectNameEnValues.reverse[projectNameEn],
        "modifiedAt": modifiedAt.toIso8601String(),
        "tripId": tripId,
        "isDVApproved": isDvApproved,
        "businessSectorNameAr": businessSectorNameArValues.reverse[businessSectorNameAr],
        "vehiclePlateNumber": vehiclePlateNumber,
        "createdAt": createdAt.toIso8601String(),
        "tripStatusAr": tripStatusArValues.reverse[tripStatusAr],
        "trailerPlateNumber": trailerPlateNumber,
        "statusGroupAr": statusGroupArValues.reverse[statusGroupAr],
        "isDeleted": isDeleted,
        "tripName": tripName,
        "modifiedBy": edByValues.reverse[modifiedBy],
        "isRepApproved": isRepApproved,
        "projectNameAr": projectNameArValues.reverse[projectNameAr],
        "statusGroup": statusGroupValues.reverse[statusGroup],
        "projectIDStr": projectIdStrValues.reverse[projectIdStr],
        "createdBy": edByValues.reverse[createdBy],
        "businessSectorNameEn": businessSectorNameEnValues.reverse[businessSectorNameEn],
        "isAccApproved": isAccApproved,
        "custodyNo": custodyNo,
        "driverName": driverName,
        "startDate": startDate?.toIso8601String(),
        "pageClassify": pageClassify,
        "tripStatus": tripStatusValues.reverse[tripStatus],
        "handHeldCode": handHeldCode,
        "journalBatchNumber": journalBatchNumber,
        "packingSlip": packingSlip,
    };
}

enum BusinessSectorNameAr { EMPTY }

final businessSectorNameArValues = EnumValues({
    "السلع": BusinessSectorNameAr.EMPTY
});

enum BusinessSectorNameEn { TRANSPORTATION }

final businessSectorNameEnValues = EnumValues({
    "Transportation": BusinessSectorNameEn.TRANSPORTATION
});

enum EdBy { HANEEN, ANAS, MARIAM_MAGDY, HANDHELD, ABDULLA_OSAMA, EMPTY, OMAR_MOSTAFA_ABDEL_SALAM_MOHAMED_GHARIB, AHMED_SABRY_MOHAMED_EL_MAHDY, MOHAMED_AHMED_ABD_EL_AAL_MOHAMED_HEIKAL, MAHMOUD_AHMED_EL_BAYOUMY_ELDEMERDASH, AHMED_FAWZY_OTHAMN_ELSAYED_OMAR, ED_BY, ABDEL_RAHMAN_AHMED_IBRAHIM_ISMAEL, EMAD_MOHAMED_MORSY_HASSANEIN, HANY_ABD_EL_MAGED_DESOKY_ABD_EL_MAGED, MOSTAFA_ISMAIL_ISMAIL, PURPLE, FLUFFY, WESAM_ELDEEN_ALAA_ABO_EL_HASSAN_MOHAMED, SAYED_IBRAHIM_EL_SAYED_IBRAHIM, MOHAMED_AHMED_HUSEEIN_HAFEZ, KARIM_MAHMOUD_MOHAMED_MOUSA, KHALIL_TAREK_KHALIL, TENTACLED, STICKY, MOHAMED_AYMAN_BASHA_MOGHAZY_AZAB, INDIGO, INDECENT, MOHAMED_AMIN_ABDALLAH_KANDIL, AHMED_MOHAMED_IBRAHIM_MOHAMED, SHAKER_SALAH, NOUR_EHAB, ABDEL_RAHMAN_IBRAHIM_HASSAN, HILARIOUS, MOHMOUD_MOHAMED_EL_DEMERDASH_MOHAMED, MIKEL_TALAAT_SHAFIK, SAMIR_MOHAMED_EL_SAEED, MICHEAL_EMAD_MAKHALY, AMBITIOUS, CUNNING, AHMED_MOHAMED_MANDOUH_EL_HUSSIENE }

final edByValues = EnumValues({
    "AbdelRahman Ahmed Ibrahim Ismael": EdBy.ABDEL_RAHMAN_AHMED_IBRAHIM_ISMAEL,
    "Abdel-Rahman Ibrahim Hassan ": EdBy.ABDEL_RAHMAN_IBRAHIM_HASSAN,
    "abdulla osama": EdBy.ABDULLA_OSAMA,
    "Ahmed Fawzy Othamn Elsayed Omar": EdBy.AHMED_FAWZY_OTHAMN_ELSAYED_OMAR,
    "Ahmed Mohamed Ibrahim Mohamed": EdBy.AHMED_MOHAMED_IBRAHIM_MOHAMED,
    "Ahmed Mohamed Mandouh ElHussiene": EdBy.AHMED_MOHAMED_MANDOUH_EL_HUSSIENE,
    "Ahmed Sabry Mohamed El Mahdy": EdBy.AHMED_SABRY_MOHAMED_EL_MAHDY,
    "محمد سامى سلامه": EdBy.AMBITIOUS,
    "Anas": EdBy.ANAS,
    "أحمد ربيع يوسف أحمد": EdBy.CUNNING,
    " محمد خالد صالح": EdBy.ED_BY,
    "Emad Mohamed Morsy Hassanein": EdBy.EMAD_MOHAMED_MORSY_HASSANEIN,
    "احمد حسين يوسف": EdBy.EMPTY,
    "مصطفي يسري فؤاد": EdBy.FLUFFY,
    "Handheld": EdBy.HANDHELD,
    "haneen": EdBy.HANEEN,
    "Hany AbdElMaged Desoky AbdElMaged": EdBy.HANY_ABD_EL_MAGED_DESOKY_ABD_EL_MAGED,
    "كريم رزق عبد الحميد ": EdBy.HILARIOUS,
    "كريم السمان ابو المجد السمان": EdBy.INDECENT,
    "محمد عثمان مغازى ابراهيم": EdBy.INDIGO,
    "Karim Mahmoud Mohamed Mousa": EdBy.KARIM_MAHMOUD_MOHAMED_MOUSA,
    "Khalil Tarek Khalil": EdBy.KHALIL_TAREK_KHALIL,
    "Mahmoud Ahmed ElBayoumy Eldemerdash": EdBy.MAHMOUD_AHMED_EL_BAYOUMY_ELDEMERDASH,
    "Mariam Magdy": EdBy.MARIAM_MAGDY,
    "Micheal Emad Makhaly": EdBy.MICHEAL_EMAD_MAKHALY,
    "Mikel Talaat Shafik": EdBy.MIKEL_TALAAT_SHAFIK,
    "Mohamed Ahmed AbdElAal Mohamed Heikal": EdBy.MOHAMED_AHMED_ABD_EL_AAL_MOHAMED_HEIKAL,
    "Mohamed Ahmed Huseein Hafez": EdBy.MOHAMED_AHMED_HUSEEIN_HAFEZ,
    "Mohamed Amin Abdallah Kandil": EdBy.MOHAMED_AMIN_ABDALLAH_KANDIL,
    "Mohamed Ayman Basha Moghazy Azab ": EdBy.MOHAMED_AYMAN_BASHA_MOGHAZY_AZAB,
    "Mohmoud Mohamed ElDemerdash Mohamed": EdBy.MOHMOUD_MOHAMED_EL_DEMERDASH_MOHAMED,
    "Mostafa Ismail Ismail": EdBy.MOSTAFA_ISMAIL_ISMAIL,
    "Nour Ehab": EdBy.NOUR_EHAB,
    "Omar Mostafa Abdel Salam Mohamed Gharib": EdBy.OMAR_MOSTAFA_ABDEL_SALAM_MOHAMED_GHARIB,
    "عبد الحكيم يحي عبد الحكيم": EdBy.PURPLE,
    "Samir Mohamed ElSaeed": EdBy.SAMIR_MOHAMED_EL_SAEED,
    "Sayed Ibrahim ElSayed Ibrahim": EdBy.SAYED_IBRAHIM_EL_SAYED_IBRAHIM,
    "Shaker Salah": EdBy.SHAKER_SALAH,
    "محمد احمد نادي عبيد": EdBy.STICKY,
    "محمد اشرف حسن محمد ": EdBy.TENTACLED,
    "Wesam Eldeen Alaa AboElHassan Mohamed ": EdBy.WESAM_ELDEEN_ALAA_ABO_EL_HASSAN_MOHAMED
});

enum ProjectIdStr { PROJ_02610001, PROJ_02710001, PROJ_02730001, PROJ_02720001, PROJ_02760001, PROJ_02210001, PROJ_0132, PROJ_0074, PROJ_02630001, PROJ_02770001, PROJ_02380001, PROJ_02670001, PROJ_02340001, PROJ_02240001 }

final projectIdStrValues = EnumValues({
    "Proj-0074": ProjectIdStr.PROJ_0074,
    "Proj-0132": ProjectIdStr.PROJ_0132,
    "Proj-0221-0001": ProjectIdStr.PROJ_02210001,
    "Proj-0224-0001": ProjectIdStr.PROJ_02240001,
    "Proj-0234-0001": ProjectIdStr.PROJ_02340001,
    "Proj-0238-0001": ProjectIdStr.PROJ_02380001,
    "Proj-0261-0001": ProjectIdStr.PROJ_02610001,
    "Proj-0263-0001": ProjectIdStr.PROJ_02630001,
    "Proj-0267-0001": ProjectIdStr.PROJ_02670001,
    "Proj-0271-0001": ProjectIdStr.PROJ_02710001,
    "Proj-0272-0001": ProjectIdStr.PROJ_02720001,
    "Proj-0273-0001": ProjectIdStr.PROJ_02730001,
    "Proj-0276-0001": ProjectIdStr.PROJ_02760001,
    "Proj-0277-0001": ProjectIdStr.PROJ_02770001
});

enum ProjectNameAr { EMPTY, PROJECT_NAME_AR, PURPLE, FLUFFY, HBI, TENTACLED, STICKY, INDIGO, INDECENT, HILARIOUS, AMBITIOUS, CUNNING }

final projectNameArValues = EnumValues({
    "يوريا -الادبية": ProjectNameAr.AMBITIOUS,
    "مصنع لافارج للاسمنت -سلاج": ProjectNameAr.CUNNING,
    "سلاج -هايدلبرج": ProjectNameAr.EMPTY,
    "فحم -بني سويف -ريلانس": ProjectNameAr.FLUFFY,
    "حديد المراكبي -HBI": ProjectNameAr.HBI,
    "سلاج -اربكو -بني سويف": ProjectNameAr.HILARIOUS,
    "فحم كوميت - وطنية بنى سويف": ProjectNameAr.INDECENT,
    "السويدي -فحم ": ProjectNameAr.INDIGO,
    "هايدلبيرج -السويس -فحم ": ProjectNameAr.PROJECT_NAME_AR,
    "فحم القطامية": ProjectNameAr.PURPLE,
    "السويس للصلب ": ProjectNameAr.STICKY,
    "كلينكر لافارج للاسمنت ": ProjectNameAr.TENTACLED
});

enum ProjectNameEn { HEIDELBERG_SLAG_EPS_SUEZ_SKY, HEIDELBERG_COAL_TRANS_EPS_SUEZ_CMT_SKY_TRUCKS, HEIDELBERG_EPS_KATTAMYA_SKY_TRUCKS, RELIANCE_EPS_WATANIA_BENI_SUEF_SKY_TRUCKS, EL_MARAKBY_STEEL_HBI_TRANS_EPS_OCTOBER_SKY_TRUCKS, LAFARGE_CLINKER_TRANS_LCE_EPS_SKY_TRUCKS, PROJ_0132_LAFARGE_CLINKER_TRANS, CLINKER_SUIF_ALEX_TRANS, SUEZ_STEEL_TRANS_EPS_SUEZ_STEEL_SKY_TRUCKS, EL_SEEWDY_COAL_TRANS_EPS_EL_SWEEDY_SKY_TRUKS, COMET_COAL_EPS_BENI_SUEF_SKY_TRUCKS, ARABCO_SLAG_TRANS_EPS_BENI_SUEF_SKY_TRUCKS, EFC_UREA_TRANS_EFC_ADABEYA_SKY_TRUCKS, LAFARGE_SLAG_TRANS_EPS_LCE_SKY_TRUCKS }

final projectNameEnValues = EnumValues({
    "Arabco Slag Trans. (EPS-Beni Suef)(Sky Trucks)": ProjectNameEn.ARABCO_SLAG_TRANS_EPS_BENI_SUEF_SKY_TRUCKS,
    "CLINKER_SUIF_ALEX_TRANS": ProjectNameEn.CLINKER_SUIF_ALEX_TRANS,
    "Comet Coal ( EPS- Beni Suef) Sky Trucks": ProjectNameEn.COMET_COAL_EPS_BENI_SUEF_SKY_TRUCKS,
    "EFC Urea Trans. (EFC-Adabeya) Sky- Trucks": ProjectNameEn.EFC_UREA_TRANS_EFC_ADABEYA_SKY_TRUCKS,
    "El-Marakby Steel HBI Trans. (EPS-October)(Sky Trucks)": ProjectNameEn.EL_MARAKBY_STEEL_HBI_TRANS_EPS_OCTOBER_SKY_TRUCKS,
    "EL SEEWDY COAL Trans ( EPS - EL SWEEDY) Sky Truks": ProjectNameEn.EL_SEEWDY_COAL_TRANS_EPS_EL_SWEEDY_SKY_TRUKS,
    "Heidelberg Coal Trans. (EPS-Suez CMT)(Sky Trucks)": ProjectNameEn.HEIDELBERG_COAL_TRANS_EPS_SUEZ_CMT_SKY_TRUCKS,
    "HEIDELBERG (EPS - Kattamya) SKY Trucks": ProjectNameEn.HEIDELBERG_EPS_KATTAMYA_SKY_TRUCKS,
    "Heidelberg Slag (EPS- Suez) Sky": ProjectNameEn.HEIDELBERG_SLAG_EPS_SUEZ_SKY,
    "Lafarge Clinker Trans. (LCE-EPS)(Sky Trucks)": ProjectNameEn.LAFARGE_CLINKER_TRANS_LCE_EPS_SKY_TRUCKS,
    "Lafarge Slag Trans. (EPS-LCE)(Sky Trucks)": ProjectNameEn.LAFARGE_SLAG_TRANS_EPS_LCE_SKY_TRUCKS,
    "Proj-0132: LAFARGE_CLINKER_TRANS": ProjectNameEn.PROJ_0132_LAFARGE_CLINKER_TRANS,
    "Reliance (EPS - Watania Beni Suef) SKY Trucks": ProjectNameEn.RELIANCE_EPS_WATANIA_BENI_SUEF_SKY_TRUCKS,
    "Suez Steel Trans. (EPS-Suez Steel) (Sky Trucks)": ProjectNameEn.SUEZ_STEEL_TRANS_EPS_SUEZ_STEEL_SKY_TRUCKS
});

enum SalesOrderId { SO_0031339, SO_0031345, SO_0031349, SO_0031347, SO_0031400, SO_0031319, SO_0017669, SO_0020339, SO_0031341, SO_0031403, SO_0031337, SO_0031343, SO_0031333, SO_0031210, SO_0031218, SO_0031223, SO_0031221, SO_0031231, SO_0031205, SO_0031202, SO_0031233 }

final salesOrderIdValues = EnumValues({
    "SO-0017669": SalesOrderId.SO_0017669,
    "SO-0020339": SalesOrderId.SO_0020339,
    "SO-0031202": SalesOrderId.SO_0031202,
    "SO-0031205": SalesOrderId.SO_0031205,
    "SO-0031210": SalesOrderId.SO_0031210,
    "SO-0031218": SalesOrderId.SO_0031218,
    "SO-0031221": SalesOrderId.SO_0031221,
    "SO-0031223": SalesOrderId.SO_0031223,
    "SO-0031231": SalesOrderId.SO_0031231,
    "SO-0031233": SalesOrderId.SO_0031233,
    "SO-0031319": SalesOrderId.SO_0031319,
    "SO-0031333": SalesOrderId.SO_0031333,
    "SO-0031337": SalesOrderId.SO_0031337,
    "SO-0031339": SalesOrderId.SO_0031339,
    "SO-0031341": SalesOrderId.SO_0031341,
    "SO-0031343": SalesOrderId.SO_0031343,
    "SO-0031345": SalesOrderId.SO_0031345,
    "SO-0031347": SalesOrderId.SO_0031347,
    "SO-0031349": SalesOrderId.SO_0031349,
    "SO-0031400": SalesOrderId.SO_0031400,
    "SO-0031403": SalesOrderId.SO_0031403
});

enum StatusGroup { COMPLETED, CREATE_TRIP, IN_TRANSIT, UNDER_REVISION, EMPTY, PENDING }

final statusGroupValues = EnumValues({
    "Completed": StatusGroup.COMPLETED,
    "Create Trip": StatusGroup.CREATE_TRIP,
    "": StatusGroup.EMPTY,
    "In transit": StatusGroup.IN_TRANSIT,
    "Pending": StatusGroup.PENDING,
    "Under Revision": StatusGroup.UNDER_REVISION
});

enum StatusGroupAr { EMPTY, STATUS_GROUP_AR, PURPLE, FLUFFY, TENTACLED, STICKY }

final statusGroupArValues = EnumValues({
    "مكتمل": StatusGroupAr.EMPTY,
    "تحت المراجعة": StatusGroupAr.FLUFFY,
    "قيد الشحن": StatusGroupAr.PURPLE,
    "إضافة رحلة": StatusGroupAr.STATUS_GROUP_AR,
    "قيد الانتظار": StatusGroupAr.STICKY,
    "": StatusGroupAr.TENTACLED
});

enum TripStatus { COMPLETED_PA_SA, BEGIN_OF_TRIP, EMPTY, COMPLETED_PA_REP, END_OF_TRIP, TRIP_STATUS, PURPLE, FLUFFY, COMPLETED_PA_DV, TENTACLED }

final tripStatusValues = EnumValues({
    "Begin Of Trip": TripStatus.BEGIN_OF_TRIP,
    "Completed - PA - DV": TripStatus.COMPLETED_PA_DV,
    "Completed - PA - Rep": TripStatus.COMPLETED_PA_REP,
    "Completed - PA - SA": TripStatus.COMPLETED_PA_SA,
    "خروج من التعتيق ( وزن فارغ)": TripStatus.EMPTY,
    "End Of Trip": TripStatus.END_OF_TRIP,
    "دخول التحميل (وزن فارغ)": TripStatus.FLUFFY,
    "خروج من التحميل (وزن قائم)": TripStatus.PURPLE,
    "وصول نفق / معدية": TripStatus.TENTACLED,
    "": TripStatus.TRIP_STATUS
});

enum TripStatusAr { EMPTY, TRIP_STATUS_AR, PURPLE, FLUFFY, TENTACLED, STICKY, INDIGO, INDECENT, HILARIOUS, AMBITIOUS }

final tripStatusArValues = EnumValues({
    "وصول نفق / معدية": TripStatusAr.AMBITIOUS,
    "مكتمل - موافقة محاسب": TripStatusAr.EMPTY,
    "مكتمل - موافقة مندوب": TripStatusAr.FLUFFY,
    "مكتمل - موافقة مراجع البيانات": TripStatusAr.HILARIOUS,
    "دخول التحميل (وزن فارغ)": TripStatusAr.INDECENT,
    "خروج من التحميل (وزن قائم)": TripStatusAr.INDIGO,
    "خروج من التعتيق ( وزن فارغ)": TripStatusAr.PURPLE,
    "": TripStatusAr.STICKY,
    "نهاية رحلة": TripStatusAr.TENTACLED,
    "بداية رحلة": TripStatusAr.TRIP_STATUS_AR
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
