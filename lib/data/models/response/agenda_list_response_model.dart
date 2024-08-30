import 'dart:convert';

class AgendaListResponse {
  final String? message;
  final List<Agenda>? data;

  AgendaListResponse({
    this.message,
    this.data,
  });

  factory AgendaListResponse.fromRawJson(String str) => AgendaListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgendaListResponse.fromJson(Map<String, dynamic> json) => AgendaListResponse(
        message: json["message"],
        data: json["data"] == null ? [] : List<Agenda>.from(json["data"]!.map((x) => Agenda.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Agenda {
  final int? id;
  final int? userId;
  final String? title;
  final String? description;
  final DateTime? eventDatetime;
  final DateTime? reminderDatetime;
  final String? attachment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Agenda({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.eventDatetime,
    this.reminderDatetime,
    this.attachment,
    this.createdAt,
    this.updatedAt,
  });

  factory Agenda.fromRawJson(String str) => Agenda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        eventDatetime: json["event_datetime"] == null ? null : DateTime.parse(json["event_datetime"]),
        reminderDatetime: json["reminder_datetime"] == null ? null : DateTime.parse(json["reminder_datetime"]),
        attachment: json["attachment"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "event_datetime": eventDatetime?.toIso8601String(),
        "reminder_datetime": reminderDatetime?.toIso8601String,
        "attachment": attachment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
