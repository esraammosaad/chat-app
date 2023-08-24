part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {
  String message;
  SignUpSuccess({required this.message});



}
class SignUpFailed extends SignUpState {

  String message;
  SignUpFailed({required this.message});
}

