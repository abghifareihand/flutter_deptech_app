import 'dart:io';

class AgendaRequest {
  final String title;
  final String description;
  final DateTime eventDateTime;
  final DateTime? reminderDateTime;
  final File? attachment;

  AgendaRequest({
    required this.title,
    required this.description,
    required this.eventDateTime,
    this.reminderDateTime,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'event_datetime': eventDateTime,
      'reminder_datetime': reminderDateTime,
    };
  }
}
