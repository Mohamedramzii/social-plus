import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/features/Home/presentation/views/changeCoverImageView.dart';

import '../../../../../../core/navigation_manager.dart';
import '../../../view_model/cubits/cubit/home_cubit.dart';

class CoverImageWidget extends StatelessWidget {
  CoverImageWidget({
    Key? key,
    required this.cover,
    required this.isInEdit,
    this.coverImage,
    this.state,
    required this.isOut,
  }) : super();

  final String cover;
  final bool isInEdit;
  final File? coverImage;
  final HomeState? state;
  final bool isOut;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: SizedBox(
            height: 160.h,
            width: double.infinity,
            //isExit indicates that we are exited from edit profle screen so cover image remains as it is
            child: state == null || isExit! == true
                ? Image.network(
                    cover,
                    fit: BoxFit.cover,
                  )
                : coverImage != null
                    ? Image.file(
                        coverImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        cover,
                        fit: BoxFit.cover,
                      ),
          ),
        ),
        // isInEdit is a boolean that indicate we are in edit profile screen so a container with edit sign is appear
        if (isInEdit)
          Positioned(
            bottom: -20,
            child: InkWell(
              onTap: () {
                Navigation.navigateWithNoReturnFromLRightToLeft(
                    screen: const ChangeCoverImageView(), context: context);
                // var cubit = BlocProvider.of<HomeCubit>(context);
                // AwesomeDialog(
                //   context: context,
                //   dialogType: DialogType.question,
                //   animType: AnimType.rightSlide,
                //   title: 'Pick An Image',
                //   desc: 'choose a way to pick your image.',
                //   btnOkOnPress: () {
                //     isExit=false;
                //     print(isExit);
                //     cubit.getCoverImage(ImageSource.gallery);
                //   },
                //   btnOkText: 'Gallery',
                //   btnOkIcon: FontAwesomeIcons.image,
                //   btnOkColor: Colors.black,
                //   btnCancelOnPress: () {
                //     isExit=false;
                //     print(isExit);
                //     cubit.getCoverImage(ImageSource.camera);
                //   },
                //   btnCancelText: 'Camera',
                //   btnCancelIcon: Icons.camera_alt_rounded,
                //   btnCancelColor: Colors.black,
                // ).show();
              },
              child: CircleAvatar(
                backgroundColor: ColorsManager.primaryColor,
                radius: 25,
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}
