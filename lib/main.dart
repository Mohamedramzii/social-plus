// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:social_app/core/app_manager/theme/theme_manager.dart';
import 'package:social_app/core/helpers/cache_helper.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Auth/presentation/views/login_view.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/home_layout.dart';

import 'core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();

  uID = CacheHelper.getData(key: 'uID');
  debugPrint('User ID: $uID');
  Widget widget;
  if (uID != null && FirebaseAuth.instance.currentUser != null) {
    widget = HomeLayoutView();
  } else {
    widget = LoginView();
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Social App',
          debugShowCheckedModeBanner: false,
          theme: Theme_Data.lightTheme,
          darkTheme: Theme_Data.darkTheme,
          themeMode: ThemeMode.light,
          home: widget,
        ),
      ),
    );
  }
}
