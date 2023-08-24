import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<void> registerUser({required email, required password}) async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccess(message: 'user created'));
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailed(message: e.code));
    } on Exception catch (e) {
      emit(SignUpFailed(message: 'there is an error'));
    }
  }
}


