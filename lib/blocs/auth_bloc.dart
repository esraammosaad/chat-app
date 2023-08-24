import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignUpEvent) {
        try {
          emit(SignUpLoading());
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(SignUpSuccess(message: 'user created'));
        } on FirebaseAuthException catch (e) {
          emit(SignUpFailed(message: e.code));
        } on Exception catch (e) {
          emit(SignUpFailed(message: 'there is an error'));
        }
      } else if (event is LoginEvent) {
        try {
          emit(LoginLoading());
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccess(message: 'success'));
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        } on Exception catch (e) {
          emit(LoginFailed(message: 'there is an error'));
        }
      }
    });
  }
}
