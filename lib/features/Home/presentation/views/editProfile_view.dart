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
import 'package:social_app/features/Home/presentation/views/changeProfileImageView.dart';
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
        if (state is UpdateUserDataSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
          Navigation.navigateWithNoReturnFromLeftToRight(
              screen: SettingsView(), context: context);
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
                          Navigation.navigateWithNoReturnFromLRightToLeft(
                              screen: ChangeProfileImageView(),
                              context: context);
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
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      homecubit.updateUserData(
                        context,
                        firstname: firstName,
                        lastname: lastName,
                        bio: bio,
                        email: email,
                        phone: phone,
                      );
                    }
                  },
                  child: Text(
                    'Update',
                    style:
                        FontManager.textStyle20.copyWith(color: Colors.white),
                  ),
                ),
              ),
              if (state is UpdateUserDataLoadingState)
                Center(child: CustomLoadingWidget()),
              if (state is! UpdateUserDataLoadingState)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 40.h,
                    color: ColorsManager.primaryColor,
                    onPressed: () {
                      isExit = true;
                      // isExitProfile=true;
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
            ],
          ),
        );
      }),
    );
  }
}
