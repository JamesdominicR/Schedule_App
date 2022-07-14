// To parse required this JSON data, do
//
// final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
    ScheduleModel({
        required this.success,
        required this.data,
        required this.msg,
        required this.errors,
    });

    bool success;
    List<Datum> data;
    String msg;
    List<dynamic> errors;

    factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.startTime,
        required this.endTime,
        required this.date,
    });

    String id;
    String name;
    String startTime;
    String endTime;
    String date;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "startTime": startTime,
        "endTime": endTime,
        "date": date
      };
}
