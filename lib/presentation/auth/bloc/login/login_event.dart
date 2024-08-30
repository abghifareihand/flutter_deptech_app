part of 'login_bloc.dart';

abstract class LoginEvent {}

class Login extends LoginEvent {
  final LoginRequest loginRequest;

  Login({required this.loginRequest});
}
