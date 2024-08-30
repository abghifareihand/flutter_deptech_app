part of 'update_agenda_bloc.dart';

abstract class UpdateAgendaEvent {}

class UpdateAgenda extends UpdateAgendaEvent {
  final String title;
  final String description;
  final int id;

  UpdateAgenda({
    required this.title,
    required this.description,
    required this.id,
  });
}
