import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser({required email, required password}) async {
    try {
      emit(LoginLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess(message: 'success'));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailed(message: e.code));
    } on Exception catch (e) {
      emit(LoginFailed(message: 'there is an error'));
    }
  }
}
