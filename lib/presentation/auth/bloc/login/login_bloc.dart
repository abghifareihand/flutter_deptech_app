import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/models/request/login_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/auth_response_model.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final result = await AuthRemoteDatasource().login(event.loginRequest);
      result.fold(
        (error) => emit(LoginError(message: error)),
        (data) => emit(LoginLoaded(authResponse: data)),
      );
    });
  }
}
