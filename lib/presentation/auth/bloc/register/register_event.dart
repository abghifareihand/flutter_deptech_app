part of 'register_bloc.dart';

abstract class RegisterEvent {}

class Register extends RegisterEvent {
  final RegisterRequest registerRequest;

  Register({required this.registerRequest});
}
