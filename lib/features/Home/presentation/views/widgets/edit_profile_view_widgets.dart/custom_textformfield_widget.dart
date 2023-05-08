import 'package:flutter/material.dart';

import 'package:social_app/core/app_manager/font/fonts_manager.dart';

import '../../../../../../core/app_manager/colors/colors_manager.dart';

class CustomTextFormFieldWidget2 extends StatelessWidget {
  const CustomTextFormFieldWidget2({
    Key? key,
    required this.initialtext,
    required this.hinttext,
    // required this.controller,
    required this.onsave,
    required this.validate,
    // required this.onsubmit,
  }) : super(key: key);
  final String? initialtext;
  final String hinttext;
  // final TextEditingController controller;
  final FormFieldSetter<String> onsave;
  final FormFieldValidator<String> validate;
  // final FormFieldSetter<String> onsubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // controller: controller,
        onSaved: onsave,
        validator: validate,
        initialValue: initialtext,
        decoration: InputDecoration(
          // labelText: labeltext,
          // labelStyle: FontManager.textStyle14bk,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixText: '$hinttext: ',

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
        ),
      ),
    );
  }
}
