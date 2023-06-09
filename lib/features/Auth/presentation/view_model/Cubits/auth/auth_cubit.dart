import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/collection_endpoint.dart';
import 'package:social_app/features/Auth/data/models/userModel.dart';

import '../../../../../../core/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        createUserData(
            firstname: firstname,
            lastname: lastname,
            email: email,
            phone: phone,
            uID: value.user!.uid);
      });
      // emit(RegisterSuccessState());
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

  loginUser({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      debugPrint(value.user!.email);
      debugPrint(value.user!.uid);
      emit(LoginSuccessState(uID: value.user!.uid));
    }).catchError((e) {
      debugPrint(e.message);
      emit(LoginFailureState(errMessage: e.message));
    });
  }

  bool isHidden = true;

  changeVisibility() {
    isHidden = !isHidden;
    emit(VisibilityChange());
  }

  createUserData({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String uID,
  }) {
    UserModel model = UserModel(
      uID: uID,
      firstname: firstname,
      lastname: lastname,
      email: email,
      phone: phone,
      bio: 'Write your bio ...',
      image:
          'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?size=626&ext=jpg',
      cover:
          'https://img.freepik.com/free-photo/galaxy-nature-aesthetic-background-starry-sky-mountain-remixed-media_53876-126761.jpg?w=996&t=st=1683061690~exp=1683062290~hmac=7e3bf6c60535f057515b91ccb57479d91753853ab94137781091e6e836ac0d8f',
      isEmailVerified: false,
    );
    CollectionEndpoints.usersCollection
        .doc(uID)
        .set(model.toJson())
        .then((value) {
      emit(UserDataCreatedSuccessState(uID: uID));
    }).catchError((e) {
      debugPrint('User Create Error : ${e.toString()}');
      emit(UserDataCreatedFailureState(errMessage: e.toString()));
    });
  }

  UserModel? userModel;
  getUserData() {
    emit(GetUserDataLoadingState());
    CollectionEndpoints.usersCollection.doc(uID).get().then((value) {
      debugPrint('User Data: ${value.data()}');
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState(userModel: userModel!));
    }).catchError((e) {
      debugPrint('User Data Error: $e');
      emit(GetUserDataFailureState(errMessage: e.toString()));
    });
  }

  addPhotos() {
    CollectionEndpoints.usersCollection
        .doc(_auth.currentUser!.uid)
        .set({'image': 'sdasd'});
  }
}
