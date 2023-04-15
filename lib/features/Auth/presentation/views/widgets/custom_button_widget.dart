import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_manager/colors/colors_manager.dart';
import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
 
 final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
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
