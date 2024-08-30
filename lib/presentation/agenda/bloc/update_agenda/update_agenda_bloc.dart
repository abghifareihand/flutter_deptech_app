import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_response_model.dart';

import '../../../../data/datasources/agenda_remote_datasource.dart';

part 'update_agenda_event.dart';
part 'update_agenda_state.dart';

class UpdateAgendaBloc extends Bloc<UpdateAgendaEvent, UpdateAgendaState> {
  UpdateAgendaBloc() : super(UpdateAgendaInitial()) {
    on<UpdateAgenda>((event, emit) async {
      emit(UpdateAgendaLoading());
      final result = await AgendaRemoteDatasource().updateAgenda(event.id, event.title, event.description);
      result.fold(
        (error) => emit(UpdateAgendaError(message: error)),
        (data) => emit(UpdateAgendaLoaded(agendaResponse: data)),
      );
    });
  }
}
