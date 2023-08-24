part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  String message;
  LoginSuccess({required this.message});



}
class LoginFailed extends LoginState {

  String message;
  LoginFailed({required this.message});
}
