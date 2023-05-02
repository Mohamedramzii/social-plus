import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';

// ignore: camel_case_types
abstract class Theme_Data {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ColorsManager.primaryColor),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: Colors.teal[200],
      ),
      tabBarTheme: TabBarTheme(
          labelColor: ColorsManager.primaryColor,
          indicatorColor: ColorsManager.primaryColor),
      scaffoldBackgroundColor: Colors.white);

  static ThemeData darkTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.grey.shade400 
    ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black45,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ColorsManager.primaryColor),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: Colors.teal[200],
      ),
      tabBarTheme: TabBarTheme(
          labelColor: ColorsManager.primaryColor,
          indicatorColor: ColorsManager.primaryColor),
      scaffoldBackgroundColor: Colors.black45);
}
