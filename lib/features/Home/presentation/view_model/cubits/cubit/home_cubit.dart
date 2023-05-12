// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_app/core/collection_endpoint.dart';
import 'package:social_app/features/Auth/data/models/userModel.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Home/data/models/post_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  File? profileImage;
  var picker = ImagePicker();

  Future<void> GetProfileImage(ImageSource) async {
    final pickedFile = await picker.pickImage(source: ImageSource);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);

      emit(ProfileImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(ProfileImagePickedErrorState(errMessage: 'NO image selected'));
    }
  }

  File? CoverImage;
  Future<void> getCoverImage(ImageSource) async {
    final pickedFile = await picker.pickImage(source: ImageSource);

    if (pickedFile != null) {
      CoverImage = File(pickedFile.path);
      emit(CoverimagePickedSuccessState());
    } else {
      print('no image selected');
      emit(CoverimagePickedErrorState(errMessage: 'NO image selected'));
    }
  }

  String? profileImageURL;
  uploadProfileImage(
    context, {
    String? firstname,
    String? lastname,
    String? bio,
    String? email,
    String? phone,
  }) {
    emit(UploadingProfileImageLoadingState());
    var user = BlocProvider.of<AuthCubit>(context).userModel!;
    var authCubit = BlocProvider.of<AuthCubit>(context);
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'usersProfileImages/${user.firstname} ${user.lastname}/${Uri.file(profileImage!.path).pathSegments.last}')
        //upload
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        CollectionEndpoints.usersCollection
            .doc(user.uID)
            .update({'image': value});
        print('DONEEEEEEEEEEEEEEEEEEE');
        // updateUserData(context,
        //     firstname: firstname,
        //     lastname: lastname,
        //     bio: bio,
        //     email: email,
        //     phone: phone,
        //     image: value);
        authCubit.getUserData();
        print('downloadLink: $value');
        emit(UploadingProfileImageSuccessState());
      }).catchError((e) {
        emit(UploadingProfileImageErrorState(errMessage: e.toString()));
      });
    }).catchError((e) {
      emit(UploadingProfileImageErrorState(errMessage: e.toString()));
    });
  }

  String? coverImageURL;
  uploadCoverImage(
    context, {
    String? firstname,
    String? lastname,
    String? bio,
    String? email,
    String? phone,
  }) {
    emit(UploadingCoverImageLoadingState());
    var user = BlocProvider.of<AuthCubit>(context).userModel!;
    var authCubit = BlocProvider.of<AuthCubit>(context);
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'usersCoverImages/${user.firstname} ${user.lastname}/${Uri.file(CoverImage!.path).pathSegments.last}')
        .putFile(CoverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        CollectionEndpoints.usersCollection
            .doc(user.uID)
            .update({'cover': value});
        authCubit.getUserData();

        // updateUserData(context,
        //     firstname: firstname,
        //     lastname: lastname,
        //     bio: bio,
        //     email: email,
        //     phone: phone,
        //     cover: value);
        emit(UploadingCoverImageSuccessState());
      }).catchError((e) {
        emit(UploadingCoverImageErrorState(errMessage: e.toString()));
      });
    }).catchError((e) {
      emit(UploadingCoverImageErrorState(errMessage: e.toString()));
    });
  }

  updateUserData(context,
      {required String? firstname,
      required String? lastname,
      required String? bio,
      required String? email,
      required String? phone,
      String? cover,
      String? image}) {
    emit(UpdateUserDataLoadingState());
    var user = BlocProvider.of<AuthCubit>(context).userModel!;
    var authCubit = BlocProvider.of<AuthCubit>(context);

    UserModel userModel = UserModel(
        uID: user.uID,
        firstname: firstname ?? user.firstname,
        lastname: lastname ?? user.lastname,
        email: email ?? user.email,
        bio: bio ?? user.bio,
        phone: phone ?? user.phone,
        cover: cover ?? user.cover,
        image: image ?? user.image,
        isEmailVerified: user.isEmailVerified);
    CollectionEndpoints.usersCollection
        .doc(user.uID)
        .update(userModel.toJson())
        .then((value) {
      authCubit.getUserData();
      emit(UpdateUserDataSuccessState());
    }).catchError((e) {
      emit(UpdateUserDataErrorState(errMessage: e.toString()));
    });
  }

  File? postImageFile;
  Future<void> GetPostImage(ImageSource) async {
    final pickedFile = await picker.pickImage(source: ImageSource);
    if (pickedFile != null) {
      postImageFile = File(pickedFile.path);

      emit(PostImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(PostImagePickedErrorState(errMessage: 'NO image selected'));
    }
  }

  String? postImageString;
  UploadPostImage(
    context, {
    String? dateTime,
    String? bodytext,
  }) {
    emit(UploadPostImageLoadingState());
    var user = BlocProvider.of<AuthCubit>(context).userModel!;
    // var authCubit = BlocProvider.of<AuthCubit>(context);
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'Posts/${user.uID}-${user.firstname} /${Uri.file(postImageFile!.path).pathSegments.last}')
        //upload
        .putFile(postImageFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        postImageString = value;
        CreateNewPost(context,
            postImage: value, bodytext: bodytext, dateTime: dateTime);
        print('downloadLink: $value');
        RemovePostImage();
        emit(UploadPostImageSuccessState());
      }).catchError((e) {
        emit(UploadPostImageErrorState(errMessage: e.toString()));
      });
    }).catchError((e) {
      emit(UploadPostImageErrorState(errMessage: e.toString()));
    });
  }

  RemovePostImage() {
    postImageFile = null;
    emit(PostImageIsNullSuccess());
  }

  CreateNewPost(
    context, {
    String? dateTime,
    String? bodytext,
    String? postImage,
  }) {
    var user = BlocProvider.of<AuthCubit>(context).userModel;

    PostModel model = PostModel(
        uID: user!.uID,
        firstname: user.firstname,
        lastname: user.lastname,
        image: user.image,
        dateTime: dateTime,
        postImage: postImage ?? '',
        bodytext: bodytext);
    emit(CreatePostLoadingState());

    CollectionEndpoints.postCollection.doc().set(model.toJson()).then((value) {
      emit(CreatePostSuccessState());
    }).catchError((e) {
      emit(CreatePostFailureState(errMessage: e.toString()));
    });
  }

  List<PostModel> posts = [];
  getAllPosts() {
    emit(GetPostsLoadingState());

    CollectionEndpoints.postCollection.get().then((value) {
      value.docs.forEach((post) {
        posts.add(PostModel.fromJson(post.data()));
      });
      emit(GetPostsSuccessState());
    }).catchError((e) {
      emit(GetPostsFailureState(errMessage: e.toString()));
    });
  }
}
