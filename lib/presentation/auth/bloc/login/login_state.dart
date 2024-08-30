part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final AuthResponse authResponse;

  LoginLoaded({required this.authResponse});
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
