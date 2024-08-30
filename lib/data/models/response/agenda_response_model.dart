import 'dart:convert';

class AgendaResponse {
  final String? message;
  final Data? data;

  AgendaResponse({
    this.message,
    this.data,
  });

  factory AgendaResponse.fromRawJson(String str) => AgendaResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgendaResponse.fromJson(Map<String, dynamic> json) => AgendaResponse(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? userId;
  final String? title;
  final String? description;
  final DateTime? eventDatetime;
  final dynamic reminderDatetime;
  final String? attachment;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.userId,
    this.title,
    this.description,
    this.eventDatetime,
    this.reminderDatetime,
    this.attachment,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        eventDatetime: json["event_datetime"] == null ? null : DateTime.parse(json["event_datetime"]),
        reminderDatetime: json["reminder_datetime"],
        attachment: json["attachment"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "title": title,
        "description": description,
        "event_datetime": eventDatetime?.toIso8601String(),
        "reminder_datetime": reminderDatetime,
        "attachment": attachment,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
