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

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  final String errMessage;
  LoginFailureState({
    required this.errMessage,
  });
}


class VisibilityChange extends AuthState{}
