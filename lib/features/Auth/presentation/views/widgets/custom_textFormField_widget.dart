import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:social_app/core/app_manager/colors/colors_manager.dart';

import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
   CustomTextFormFieldWidget({
    super.key,
    required this.title,
    required this.hinttext,
     this.icon,
    this.suffixicon,
    required this.controller,
    required this.onsave,
    required this.onvalidate,
  });

  final String title;
  final String hinttext;
   IconData? icon;
  final Widget? suffixicon;
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
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: hinttext,
            
            prefixIcon: Icon(
              icon,
              color: ColorsManager.primaryColor,
              size: 30,
            ),
            suffixIcon:suffixicon,
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
          ),
        )
      ],
    );
  }
}
