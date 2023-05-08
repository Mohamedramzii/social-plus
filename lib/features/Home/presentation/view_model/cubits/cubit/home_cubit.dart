// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_app/core/collection_endpoint.dart';
import 'package:social_app/features/Auth/data/models/userModel.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';

import '../../../../../../core/common_widgets/custom_toast_widget.dart';

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
      emit(ProfileImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(ProfileImagePickedErrorState(errMessage: 'NO image selected'));
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
      {
      required String? firstname,
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

//   updateAllData(
//     context, {
//     required String firstname,
//     required String lastname,
//     required String bio,
//     required String email,
//     required String phone,
//   }) {
//     emit(UpdateAllDataLoadingState());
//     var user = BlocProvider.of<AuthCubit>(context).userModel!;

//     if (profileImage != null && CoverImage == null) {
//       firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child(
//               'usersProfileImages/${user.firstname} ${user.lastname}/${Uri.file(profileImage!.path).pathSegments.last}')
//           //upload
//           .putFile(profileImage!)
//           .then((value) {
//         value.ref.getDownloadURL().then((value) {
//           profileImageURL = value;
//           print('downloadLink: $value');
//         }).catchError((e) {
//           emit(UpdateAllDataErrorState(errMessage: e.toString()));
//         });
//       }).catchError((e) {
//         emit(UpdateAllDataErrorState(errMessage: e.toString()));
//       }).then((_) {
//         updateUserData(context,
//             firstname: firstname,
//             lastname: lastname,
//             bio: bio,
//             email: email,
//             phone: phone,
//             cover: coverImageURL,
//             image: profileImageURL);
//         emit(UpdateAlldataSuccessState());
//       });
//     } else if (CoverImage != null && profileImage == null) {
//       firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child(
//               'usersCoverImages/${user.firstname} ${user.lastname}/${Uri.file(CoverImage!.path).pathSegments.last}')
//           .putFile(CoverImage!)
//           .then((value) {
//         value.ref.getDownloadURL().then((value) {
//           coverImageURL = value;
//         }).catchError((e) {
//           emit(UpdateAllDataErrorState(errMessage: e.toString()));
//         });
//       }).catchError((e) {
//         emit(UpdateAllDataErrorState(errMessage: e.toString()));
//       }).then((_) {
//         updateUserData(context,
//             firstname: firstname,
//             lastname: lastname,
//             bio: bio,
//             email: email,
//             phone: phone,
//             cover: coverImageURL,
//             image: profileImageURL);

//         emit(UpdateAlldataSuccessState());
//       });
//     } else if (profileImage != null && CoverImage != null) {
//       firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child(
//               'usersProfileImages/${user.firstname} ${user.lastname}/${Uri.file(profileImage!.path).pathSegments.last}')
//           //upload
//           .putFile(profileImage!)
//           .then((value) {
//         value.ref.getDownloadURL().then((value) {
//           profileImageURL = value;
//           print('downloadLink: $value');
//         }).catchError((e) {
//           emit(UpdateAllDataErrorState(errMessage: e.toString()));
//         });
//       }).catchError((e) {
//         emit(UpdateAllDataErrorState(errMessage: e.toString()));
//       }).then((_) {
// // var user = BlocProvider.of<AuthCubit>(context).userModel!;
//         firebase_storage.FirebaseStorage.instance
//             .ref()
//             .child(
//                 'usersCoverImages/${user.firstname} ${user.lastname}/${Uri.file(CoverImage!.path).pathSegments.last}')
//             .putFile(CoverImage!)
//             .then((value) {
//           value.ref.getDownloadURL().then((value) {
//             coverImageURL = value;
//           }).catchError((e) {
//             emit(UpdateAllDataErrorState(errMessage: e.toString()));
//           });
//         }).catchError((e) {
//           emit(UpdateAllDataErrorState(errMessage: e.toString()));
//         });
//       }).then((_) {
//         updateUserData(context,
//             firstname: firstname,
//             lastname: lastname,
//             bio: bio,
//             email: email,
//             phone: phone,
//             cover: coverImageURL,
//             image: profileImageURL);
//         emit(UpdateAlldataSuccessState());
//       });
//     }
//   }
}
