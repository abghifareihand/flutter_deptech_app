part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final AuthResponse authResponse;

  RegisterLoaded({required this.authResponse});
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
