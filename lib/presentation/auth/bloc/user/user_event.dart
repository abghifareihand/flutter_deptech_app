part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUser extends UserEvent {}

class UpdateUser extends UserEvent {
  final UserRequest userRequest;

  UpdateUser({required this.userRequest});
}
