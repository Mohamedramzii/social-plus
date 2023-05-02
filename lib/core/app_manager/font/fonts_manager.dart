import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';

abstract class FontManager {
  static TextStyle textStyle45 = GoogleFonts.dynaPuff(
      textStyle: TextStyle(
          fontSize: 45.sp,
          fontWeight: FontWeight.w900,
          color: ColorsManager.primaryColor));
  static TextStyle textStyle20 = GoogleFonts.sourceCodePro(
      textStyle: TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
  ));

  static TextStyle textStyle14 = GoogleFonts.sourceCodePro(
      textStyle: TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.primaryColor,
  ));
  static TextStyle textStyle14bk = GoogleFonts.abel(
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w900));
  static TextStyle textStyle14gry = GoogleFonts.abel(
      textStyle: TextStyle(
    fontSize: 12.sp,
    color: Colors.grey,
  ));
  static TextStyle textStylepostBody = GoogleFonts.montserrat(
      textStyle: TextStyle(
    fontSize: 14.sp,
    // color: Colors.grey,
  ));
}
