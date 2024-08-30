import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';
import '../../../../data/models/request/register_request_model.dart';
import '../../../../data/models/response/auth_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      emit(RegisterLoading());
      final result = await AuthRemoteDatasource().register(event.registerRequest);
      result.fold(
        (error) => emit(RegisterError(message: error)),
        (data) => emit(RegisterLoaded(authResponse: data)),
      );
    });
  }
}
