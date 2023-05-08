import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants.dart';
import '../../../view_model/cubits/cubit/home_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    Key? key,
    required this.image,
    required this.isInEdit,
    this.profileImage,
    this.state,
  }) : super(key: key);

  final String image;
  final bool isInEdit;
  final File? profileImage;
  final HomeState? state;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 100.w,
      bottom: -50,
      child: Hero(
        tag: 'profileImage',
        child: CircleAvatar(
          radius: 75,
          backgroundColor: Colors.white,
          child: CircleAvatar(
              radius: 70,
              //isExit indicates that we are exited from edit profle screen so cover image remains as it is 
              backgroundImage: state == null 
              || isExit == true
                  ? NetworkImage(image)
                  : profileImage != null
                      ? FileImage(profileImage!) as ImageProvider
                      : NetworkImage(image)),
        ),
      ),
    );
  }
}
