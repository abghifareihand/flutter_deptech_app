part of 'update_agenda_bloc.dart';

abstract class UpdateAgendaState {}

class UpdateAgendaInitial extends UpdateAgendaState {}

class UpdateAgendaLoading extends UpdateAgendaState {}

class UpdateAgendaLoaded extends UpdateAgendaState {
  final AgendaResponse agendaResponse;

  UpdateAgendaLoaded({required this.agendaResponse});
}

class UpdateAgendaError extends UpdateAgendaState {
  final String message;

  UpdateAgendaError({required this.message});
}
