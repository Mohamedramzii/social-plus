import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_manager/colors/colors_manager.dart';
import '../../../../../core/app_manager/font/fonts_manager.dart';
import '../../view_model/Cubits/auth/auth_cubit.dart';

class CustomButtonWidget extends StatelessWidget {
   CustomButtonWidget({
    Key? key,
    required this.text,
     this.formKey,
     this.cubit
  }) : super(key: key);
 
 final String text;
 final GlobalKey<FormState>? formKey;
 AuthCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if(formKey!.currentState!.validate()){
          formKey!.currentState!.save();
          // cubit.userRegister(firstname: firstname, lastname: lastname, email: email, password: password)
        }
      },
      minWidth: double.infinity,
      height: 45.h,
      color: ColorsManager.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: FontManager.textStyle20
            .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }
}
