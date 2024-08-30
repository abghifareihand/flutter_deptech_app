import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/datasources/agenda_remote_datasource.dart';
import 'package:flutter_deptech_app/data/models/request/agenda_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_response_model.dart';

part 'add_agenda_event.dart';
part 'add_agenda_state.dart';

class AddAgendaBloc extends Bloc<AddAgendaEvent, AddAgendaState> {
  AddAgendaBloc() : super(AddAgendaInitial()) {
    on<AddAgenda>((event, emit) async {
      emit(AddAgendaLoading());
      final result = await AgendaRemoteDatasource().createAgenda(event.agendaRequest);
      result.fold(
        (error) => emit(AddAgendaError(message: error)),
        (data) => emit(AddAgendaLoaded(agendaResponse: data)),
      );
    });
  }
}
