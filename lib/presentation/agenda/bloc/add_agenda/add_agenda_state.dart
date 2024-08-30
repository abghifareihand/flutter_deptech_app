part of 'add_agenda_bloc.dart';

abstract class AddAgendaState {}

class AddAgendaInitial extends AddAgendaState {}

class AddAgendaLoading extends AddAgendaState {}

class AddAgendaLoaded extends AddAgendaState {
  final AgendaResponse agendaResponse;

  AddAgendaLoaded({required this.agendaResponse});
}

class AddAgendaError extends AddAgendaState {
  final String message;

  AddAgendaError({required this.message});
}
