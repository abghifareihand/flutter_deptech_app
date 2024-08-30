import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_list_response_model.dart';

import '../../../../data/datasources/agenda_remote_datasource.dart';

part 'get_agenda_event.dart';
part 'get_agenda_state.dart';

class GetAgendaBloc extends Bloc<GetAgendaEvent, GetAgendaState> {
  GetAgendaBloc() : super(GetAgendaInitial()) {
    on<GetAgenda>((event, emit) async {
      emit(GetAgendaLoading());
      final result = await AgendaRemoteDatasource().fetchAgenda();
      result.fold(
        (error) => emit(GetAgendaError(message: error)),
        (data) => emit(GetAgendaLoaded(agendaResponse: data)),
      );
    });
  }
}
