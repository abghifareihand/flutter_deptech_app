part of 'delete_agenda_bloc.dart';

abstract class DeleteAgendaState {}

class DeleteAgendaInitial extends DeleteAgendaState {}

class DeleteAgendaLoading extends DeleteAgendaState {}

class DeleteAgendaLoaded extends DeleteAgendaState {
  final String message;

  DeleteAgendaLoaded({required this.message});
}

class DeleteAgendaError extends DeleteAgendaState {
  final String message;

  DeleteAgendaError({required this.message});
}
