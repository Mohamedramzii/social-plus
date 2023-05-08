// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/settingsView.dart';
import 'package:social_app/features/Home/presentation/views/widgets/edit_profile_view_widgets.dart/custom_textformfield_widget.dart';
import 'package:social_app/features/Home/presentation/views/widgets/settings_widgets/cover_profile_images_widget.dart';

import '../../../../core/app_manager/colors/colors_manager.dart';
import '../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../core/common_widgets/custom_loading_widget.dart';
import '../../../../core/navigation_manager.dart';
import '../../../Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'widgets/settings_widgets/profile_image_widget.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  String? firstName;
  String? lastName;
  String? bio;
  String? email;
  String? phone;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Your Profile',
          style: FontManager.textStyle20
              .copyWith(color: ColorsManager.primaryColor),
        ),
        leading: Container(),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        // if (state is UpdateUserDataSuccessState) {
        //   CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
        // }
        if (state is UploadingProfileImageSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SettingsView(),
          ));
        } else if (state is UploadingCoverImageSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SettingsView(),
          ));
        } else if (state is UploadingProfileImageSuccessState &&
            state is UploadingCoverImageSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SettingsView(),
          ));
        }

        if (state is UploadingProfileImageErrorState ||
            state is UploadingCoverImageErrorState) {
          CustomToastWidget.showFailureToast(text: 'Something error');
        }
      }, builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        var homecubit = BlocProvider.of<HomeCubit>(context);
        var profileImage = BlocProvider.of<HomeCubit>(context).profileImage;
        var coverImage = BlocProvider.of<HomeCubit>(context).CoverImage;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    CoverImageWidget(
                      isOut: false,
                      cover: cubit.userModel!.cover!,
                      isInEdit: true,
                      coverImage: coverImage,
                      state: state,
                    ),
                    ProfileImageWidget(
                      image: cubit.userModel!.image!,
                      isInEdit: true,
                      state: state,
                      profileImage: profileImage,
                    ),
                    Positioned(
                      left: 100.w,
                      bottom: -50,
                      child: InkWell(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.rightSlide,
                            title: 'Pick An Image',
                            desc: 'choose a way to pick your image.',
                            btnOkOnPress: () {
                              isExit=false;
                              homecubit.GetProfileImage(ImageSource.gallery);
                            },
                            btnOkText: 'Gallery',
                            btnOkIcon: FontAwesomeIcons.image,
                            btnOkColor: Colors.black,
                            btnCancelOnPress: () {
                              isExit=false;
                              homecubit.GetProfileImage(ImageSource.camera);
                            },
                            btnCancelText: 'Camera',
                            btnCancelIcon: Icons.camera_alt_rounded,
                            btnCancelColor: Colors.black,
                          ).show();
                        },
                        child: const CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.white54,
                          child: Icon(Icons.add_a_photo_outlined,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              // if (homecubit.profileImage != null &&
              //     homecubit.CoverImage != null)
              //   Column(
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             if (_formkey.currentState!.validate()) {
              //               _formkey.currentState!.save();
              //               homecubit.uploadProfileImage(context,
              //                   firstname: firstName!,
              //                   lastname: lastName!,
              //                   bio: bio!,
              //                   email: email!,
              //                   phone: phone!);
              //               homecubit.uploadCoverImage(context,
              //                   firstname: firstName!,
              //                   lastname: lastName!,
              //                   bio: bio!,
              //                   email: email!,
              //                   phone: phone!);
              //             }
              //           },
              //           style: ButtonStyle(
              //               backgroundColor: MaterialStatePropertyAll(
              //                   ColorsManager.primaryColor)),
              //           child: Text(
              //             'Update both Cover and Profile Images',
              //           )),
              //       if (state is UploadingProfileImageLoadingState &&
              //           state is UploadingCoverImageLoadingState)
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 58.w),
              //           child: LinearProgressIndicator(
              //             color: ColorsManager.primaryColor,
              //           ),
              //         )
              //     ],
              //   ),

              // if (homecubit.CoverImage != null)
              //   Column(
              //     children: [
              //       if (state is! UpdateUserDataSuccessState)
              //         ElevatedButton(
              //             onPressed: () {
              //               if (_formkey.currentState!.validate()) {
              //                 _formkey.currentState!.save();
              //                 homecubit.uploadCoverImage(context,
              //                     firstname: firstName!,
              //                     lastname: lastName!,
              //                     bio: bio!,
              //                     email: email!,
              //                     phone: phone!);
              //               }
              //             },
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll(
              //                     ColorsManager.primaryColor)),
              //             child: Text(
              //               'Update Cover Image',
              //             )),
              //       if (state is UploadingCoverImageLoadingState)
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 120.w),
              //           child: LinearProgressIndicator(
              //             color: ColorsManager.primaryColor,
              //           ),
              //         )
              //     ],
              //   ),
              // if (homecubit.profileImage != null)
              //   Column(
              //     children: [
              //       if (state is! UpdateUserDataSuccessState)
              //         ElevatedButton(
              //             onPressed: () {
              //               if (_formkey.currentState!.validate()) {
              //                 _formkey.currentState!.save();
              //                 homecubit.uploadProfileImage(context,
              //                     firstname: firstName!,
              //                     lastname: lastName!,
              //                     bio: bio!,
              //                     email: email!,
              //                     phone: phone!);
              //               }
              //             },
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll(
              //                     ColorsManager.primaryColor)),
              //             child: Text(
              //               'Update Profile Image',
              //             )),
              //       if (state is UploadingProfileImageLoadingState)
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 120.w),
              //           child: LinearProgressIndicator(
              //             color: ColorsManager.primaryColor,
              //           ),
              //         )
              //     ],
              //   ),
              Form(
                key: _formkey,
                child: Column(children: [
                  CustomTextFormFieldWidget2(
                    // controller: firstname_controller,
                    initialtext: cubit.userModel!.firstname!,
                    hinttext: 'Firstname',
                    onsave: (value) {
                      firstName = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide your first name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget2(
                    // controller: firstname_controller,
                    initialtext: cubit.userModel!.lastname!,
                    hinttext: 'Lastname',
                    onsave: (value) {
                      lastName = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide your last name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget2(
                    // controller: firstname_controller,
                    initialtext: cubit.userModel!.bio!,
                    hinttext: 'Bio',
                    onsave: (value) {
                      bio = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide your bio';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget2(
                    // controller: firstname_controller,
                    initialtext: cubit.userModel!.email!,
                    hinttext: 'Email Address',
                    onsave: (value) {
                      email = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide your email address';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget2(
                    // controller: firstname_controller,
                    initialtext: cubit.userModel!.phone!,
                    hinttext: 'Phone Number',
                    onsave: (value) {
                      phone = value!;
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide your phone number';
                      }
                      return null;
                    },
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  disabledColor: Colors.grey,
                  minWidth: double.infinity,
                  height: 40.h,
                  color: ColorsManager.primaryColor,
                  onPressed: () {
                    if (isExit == true) {
                      print(isExit);
                      null;
                    } else {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        if (homecubit.CoverImage != null &&
                            homecubit.profileImage == null) {
                          homecubit.uploadCoverImage(context,
                              firstname: firstName!,
                              lastname: lastName!,
                              bio: bio!,
                              email: email!,
                              phone: phone!);

                          print(
                              '##############Cover Only changed###################');
                        } else if (homecubit.profileImage != null &&
                            homecubit.CoverImage == null) {
                          homecubit.uploadProfileImage(context,
                              firstname: firstName!,
                              lastname: lastName!,
                              bio: bio!,
                              email: email!,
                              phone: phone!);

                          print(
                              '###########Profile Only changed##############');
                        } else if (homecubit.profileImage != null &&
                            homecubit.CoverImage != null) {
                          homecubit.uploadProfileImage(context,
                              firstname: firstName!,
                              lastname: lastName!,
                              bio: bio!,
                              email: email!,
                              phone: phone!);
                          homecubit.uploadCoverImage(context,
                              firstname: firstName!,
                              lastname: lastName!,
                              bio: bio!,
                              email: email!,
                              phone: phone!);

                          print(
                              '###############Both changed##################');
                        }
                      }
                    }
                    // Navigation.navigateWithNoReturnFromLeftToRight(
                    //     screen: SettingsView(), context: context);
                  },
                  child: Text(
                    'Update',
                    style:
                        FontManager.textStyle20.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 40.h,
                  color: ColorsManager.primaryColor,
                  onPressed: () {
                    isExit = true;
                    Navigation.navigateWithNoReturnFromLeftToRight(
                        screen: SettingsView(), context: context);
                    print(isExit);
                  },
                  child: Text(
                    'Back',
                    style:
                        FontManager.textStyle20.copyWith(color: Colors.white),
                  ),
                ),
              ),
              if (state is UpdateUserDataLoadingState ||
                  state is UploadingProfileImageLoadingState ||
                  state is UploadingCoverImageLoadingState)
                Center(child: CustomLoadingWidget())
            ],
          ),
        );
      }),
    );
  }
}
