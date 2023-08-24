part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  String message;
  SignUpSuccess({required this.message});
}

class SignUpFailed extends AuthState {
  String message;
  SignUpFailed({required this.message});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  String message;
  LoginSuccess({required this.message});
}

class LoginFailed extends AuthState {
  String message;
  LoginFailed({required this.message});
}
