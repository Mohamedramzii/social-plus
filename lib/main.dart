import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/app_manager/theme/theme_manager.dart';
import 'package:social_app/features/Auth/presentation/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Social App',
        debugShowCheckedModeBanner: false,
        theme: Theme_Data.lightTheme,
        darkTheme: Theme_Data.darkTheme,
        themeMode: ThemeMode.light,
        home:  LoginView(),
      ),
    );
  }
}
