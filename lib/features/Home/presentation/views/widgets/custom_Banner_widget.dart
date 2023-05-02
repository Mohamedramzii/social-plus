import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';

import '../../../../../core/app_manager/colors/colors_manager.dart';
import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
        content: Row(children: [
          Icon(
            Icons.info,
            color: ColorsManager.primaryColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Please Verify Your Email',
            style: FontManager.textStyle14,
          )
        ]),
        actions: [
          TextButton(
              style: ButtonStyle(
                  maximumSize: MaterialStatePropertyAll(Size.fromWidth(80.w)),
                  overlayColor: MaterialStatePropertyAll(
                    Colors.teal[200],
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.teal[300],
                  )),
              onPressed: () {
                FirebaseAuth.instance.currentUser!
                    .sendEmailVerification()
                    .then((value) {
                  CustomToastWidget.showSuccessToast(text: 'Check Your Mail');
                }).catchError((e) {
                  CustomToastWidget.showFailureToast(
                      text: 'Something Error with your email address');
                });
              },
              child: Text(
                'Send',
                style: FontManager.textStyle14,
              ))
        ]);
  }
}
