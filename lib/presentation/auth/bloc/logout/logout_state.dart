part of 'logout_bloc.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  final String message;

  LogoutLoaded({required this.message});
}

class LogoutError extends LogoutState {
  final String message;

  LogoutError({required this.message});
}
