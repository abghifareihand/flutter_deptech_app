import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasources/agenda_remote_datasource.dart';

part 'delete_agenda_event.dart';
part 'delete_agenda_state.dart';

class DeleteAgendaBloc extends Bloc<DeleteAgendaEvent, DeleteAgendaState> {
  DeleteAgendaBloc() : super(DeleteAgendaInitial()) {
    on<DeleteAgenda>((event, emit) async {
      emit(DeleteAgendaLoading());
      final result = await AgendaRemoteDatasource().deleteAgenda(event.id);
      result.fold(
        (error) => emit(DeleteAgendaError(message: error)),
        (data) => emit(DeleteAgendaLoaded(message: data)),
      );
    });
  }
}
