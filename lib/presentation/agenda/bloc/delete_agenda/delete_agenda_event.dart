part of 'delete_agenda_bloc.dart';

abstract class DeleteAgendaEvent {}

class DeleteAgenda extends DeleteAgendaEvent {
  final int id;
  DeleteAgenda({required this.id});
}
