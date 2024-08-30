part of 'add_agenda_bloc.dart';

abstract class AddAgendaEvent {}

class AddAgenda extends AddAgendaEvent {
  final AgendaRequest agendaRequest;

  AddAgenda({required this.agendaRequest});
}
