import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:social_app/core/app_manager/colors/colors_manager.dart';

import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    Key? key,
    required this.title,
    required this.hinttext,
    required this.inputaction,
    this.suffixicon,
    this.icon,
    required this.keyboardtype,
    required this.isPassword,
    required this.controller,
    required this.onsave,
    required this.onvalidate,
  }) : super(key: key);

  final String title;
  final String hinttext;
  IconData? icon;
  final TextInputAction inputaction;
  final Widget? suffixicon;
  final TextInputType keyboardtype;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldSetter<String> onsave;
  final FormFieldValidator<String> onvalidate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontManager.textStyle14,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: controller,
          onSaved: onsave,
          validator: onvalidate,
          keyboardType: keyboardtype,
          obscureText:isPassword ,
          textInputAction:inputaction,
          decoration: InputDecoration(
            hintText: hinttext,
            prefixIcon: Icon(
              icon,
              color: ColorsManager.primaryColor,
              size: 30,
            ),
            suffixIcon: suffixicon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
