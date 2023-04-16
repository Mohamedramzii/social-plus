import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/app_manager/theme/theme_manager.dart';
import 'package:social_app/features/Auth/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: LoginView(),
      ),
    );
  }
}
