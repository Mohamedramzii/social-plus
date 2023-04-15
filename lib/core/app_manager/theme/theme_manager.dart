import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class Theme_Data {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
    backgroundColor: HexColor('CC0E75'),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('CC0E75'),
    ),
  ));

  static ThemeData darkTheme = ThemeData();
}
