import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/models/request/user_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/user_response_model.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      final result = await AuthRemoteDatasource().fetchUser();
      result.fold(
        (error) => emit(UserError(message: error)),
        (data) => emit(UserLoaded(userResponse: data)),
      );
    });

    on<UpdateUser>((event, emit) async {
      emit(UserLoading());
      final result = await AuthRemoteDatasource().updateUser(event.userRequest);
      result.fold(
        (error) => emit(UserError(message: error)),
        (data) => emit(UserLoaded(userResponse: data)),
      );
    });
  }
}
