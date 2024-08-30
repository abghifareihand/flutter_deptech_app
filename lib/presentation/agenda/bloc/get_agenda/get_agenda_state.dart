part of 'get_agenda_bloc.dart';

abstract class GetAgendaState {}

class GetAgendaInitial extends GetAgendaState {}

class GetAgendaLoading extends GetAgendaState {}

class GetAgendaLoaded extends GetAgendaState {
  final AgendaListResponse agendaResponse;

  GetAgendaLoaded({required this.agendaResponse});
}

class GetAgendaError extends GetAgendaState {
  final String message;

  GetAgendaError({required this.message});
}
