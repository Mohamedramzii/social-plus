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

//Post Image Picker
class PostImagePickedLoadingState extends HomeState {}

class PostImagePickedSuccessState extends HomeState {}

class PostImagePickedErrorState extends HomeState {
  final String errMessage;
  PostImagePickedErrorState({
    required this.errMessage,
  });
}

// upload post image states
class UploadPostImageLoadingState extends HomeState {}

class UploadPostImageSuccessState extends HomeState {}

class UploadPostImageErrorState extends HomeState {
  final String errMessage;
  UploadPostImageErrorState({
    required this.errMessage,
  });
}

// Create Post States
class CreatePostLoadingState extends HomeState {}

class CreatePostSuccessState extends HomeState {}

class CreatePostFailureState extends HomeState {
  final String errMessage;
  CreatePostFailureState({
    required this.errMessage,
  });
}

// set post image file to null
class PostImageIsNullSuccess extends HomeState {}

// get Posts
class GetPostsSuccessState extends HomeState {}

class GetPostsLoadingState extends HomeState {}

class GetPostsFailureState extends HomeState {
  final String errMessage;
  GetPostsFailureState({
    required this.errMessage,
  });
}
