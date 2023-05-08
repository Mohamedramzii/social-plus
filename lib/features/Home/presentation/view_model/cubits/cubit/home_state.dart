part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// Profile Image Picker
class ProfileImagePickedSuccessState extends HomeState {}

class ProfileImagePickedLoadingState extends HomeState {}

class ProfileImagePickedErrorState extends HomeState {
  final String errMessage;
  ProfileImagePickedErrorState({
    required this.errMessage,
  });
}

// Cover Image Picker
class CoverimagePickedSuccessState extends HomeState {}

class CoverimagePickedLoadingState extends HomeState {}

class CoverimagePickedErrorState extends HomeState {
  final String errMessage;
  CoverimagePickedErrorState({
    required this.errMessage,
  });
}

//Uploading Profile Image
class UploadingProfileImageSuccessState extends HomeState {}

class UploadingProfileImageLoadingState extends HomeState {}
class UploadingProfileImageEndState extends HomeState {}

class UploadingProfileImageErrorState extends HomeState {
  final String errMessage;
  UploadingProfileImageErrorState({
    required this.errMessage,
  });
}

//Uploading Cover Image
class UploadingCoverImageSuccessState extends HomeState {}

class UploadingCoverImageLoadingState extends HomeState {}

class UploadingCoverImageErrorState extends HomeState {
  final String errMessage;
  UploadingCoverImageErrorState({
    required this.errMessage,
  });
}


//update user Data
class UpdateUserDataSuccessState extends HomeState {}

class UpdateUserDataLoadingState extends HomeState {}

class UpdateUserDataErrorState extends HomeState {
  final String errMessage;
  UpdateUserDataErrorState({
    required this.errMessage,
  });
}
class UpdateAlldataSuccessState extends HomeState {}

class UpdateAllDataLoadingState extends HomeState {}

class UpdateAllDataErrorState extends HomeState {
  final String errMessage;
  UpdateAllDataErrorState({
    required this.errMessage,
  });
}
