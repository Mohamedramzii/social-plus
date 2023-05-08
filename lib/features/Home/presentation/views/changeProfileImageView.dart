import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/settingsView.dart';

import '../../../../core/constants.dart';
import '../../../../core/navigation_manager.dart';
import '../../../Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';

class ChangeProfileImageView extends StatelessWidget {
  const ChangeProfileImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UploadingProfileImageSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Updated Successfully');
          Navigation.navigateWithNoReturnFromLeftToRight(
              screen: const SettingsView(), context: context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        var homecubit = BlocProvider.of<HomeCubit>(context);
        var profileImage = BlocProvider.of<HomeCubit>(context).profileImage;
        // var coverImage = BlocProvider.of<HomeCubit>(context).CoverImage;
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.w, top: 70.h),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Hero(
                        tag: 'profileImage',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            width: double.infinity,
                            height: 450.h,
                            child: state == null || isExit == true
                                ? Image.network(
                                    cubit.userModel!.image!,
                                    fit: BoxFit.cover,
                                  )
                                : profileImage != null
                                    ? Image.file(
                                        profileImage,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        cubit.userModel!.image!,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                        right: 168.w,
                        bottom: 220.h,
                        child: IconButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.question,
                                animType: AnimType.rightSlide,
                                title: 'Pick An Image',
                                desc: 'choose a way to pick your image.',
                                btnOkOnPress: () {
                                  // isExitProfile=false;
                                  isExit = false;
                                  homecubit.GetProfileImage(
                                      ImageSource.gallery);
                                },
                                btnOkText: 'Gallery',
                                btnOkIcon: FontAwesomeIcons.image,
                                btnOkColor: Colors.black,
                                btnCancelOnPress: () {
                                  // isExitProfile=false;
                                  isExit = false;
                                  homecubit.GetProfileImage(ImageSource.camera);
                                },
                                btnCancelText: 'Camera',
                                btnCancelIcon: Icons.camera_alt_rounded,
                                btnCancelColor: Colors.black,
                              ).show();
                            },
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              size: 70,
                              color: ColorsManager.primaryColor,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (profileImage != null)
                    MaterialButton(
                        color: ColorsManager.primaryColor,
                        minWidth: double.infinity,
                        height: 40.h,
                        onPressed: () {
                          homecubit.uploadProfileImage(context);
                        },
                        child: Text(
                          'Update',
                          style: FontManager.textStyle20bk
                              .copyWith(color: Colors.white),
                        )),
                  SizedBox(
                    height: 5.h,
                  ),
                  if (state is UploadingProfileImageLoadingState)
                    const LinearProgressIndicator(),
                  SizedBox(
                    height: 10.h,
                  ),
                  MaterialButton(
                      color: Colors.grey,
                      minWidth: double.infinity,
                      height: 40.h,
                      onPressed: () {
                        Navigation.navigateWithNoReturnFromLeftToRight(
                            screen: const SettingsView(), context: context);
                      },
                      child: Text(
                        'Cancel',
                        style: FontManager.textStyle20bk
                            .copyWith(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
