import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> userRegister({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that username.';
      }
      emit(RegisterFailureState(errMessage: message));
    }
  }

  userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      debugPrint(value.user!.email);
      debugPrint(value.user!.uid);
      emit(LoginSuccessState());
    }).catchError((e) {
      debugPrint(e.message);
      emit(LoginFailureState(errMessage: e.message));
    });
  }

  bool isHidden =true;

  changeVisibility() {
    isHidden = !isHidden;
    emit(VisibilityChange());
  }
}
