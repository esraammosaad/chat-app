part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  String email;
  String password;
  SignUpEvent({required this.email, required this.password});
}

class LoginEvent extends AuthEvent {

  String email;
  String password;
  LoginEvent({required this.email, required this.password});
}
