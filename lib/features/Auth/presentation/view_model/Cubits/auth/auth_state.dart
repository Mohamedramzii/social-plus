part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errMessage;
  RegisterFailureState({
    required this.errMessage,
  });
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String uID;
  LoginSuccessState({
    required this.uID,
  });
}

class LoginFailureState extends AuthState {
  final String errMessage;
  LoginFailureState({
    required this.errMessage,
  });
}

class UserDataCreatedSuccessState extends AuthState {
  final String uID;
  UserDataCreatedSuccessState({
    required this.uID,
  });
}

class UserDataCreatedFailureState extends AuthState {
  final String errMessage;
  UserDataCreatedFailureState({
    required this.errMessage,
  });
}

class VisibilityChange extends AuthState {}


class GetUserDataSuccessState extends AuthState {
  final UserModel userModel;
  GetUserDataSuccessState({
    required this.userModel,
  });
}

class GetUserDataLoadingState extends AuthState {}

class GetUserDataFailureState extends AuthState {
  final String errMessage;
  GetUserDataFailureState({
    required this.errMessage,
  });
}
