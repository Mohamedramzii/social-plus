import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/features/Auth/presentation/views/signup_view.dart';
import 'package:social_app/features/Auth/presentation/views/widgets/custom_button_widget.dart';
import 'package:social_app/core/common_widgets/custom_logo_widget.dart';
import '../../../../core/navigation_manager.dart';
import 'widgets/custom_greeting_widget.dart';
import 'widgets/custom_question_widget.dart';
import 'widgets/custom_textFormField_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                const CustomLogoWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: const CustomGreetingWidget(
                    text1: 'Welcome Again!',
                    text2: 'Login to continue!',
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomTextFormFieldWidget(
                  title: 'Email Address',
                  hinttext: 'example@gmail.com',
                  icon: Icons.email,
                  controller: emailcontroller,
                  onsave: (value) {},
                  onvalidate: (value) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormFieldWidget(
                  title: 'Password',
                  hinttext: 'enter at least 8 characters',
                  icon: Icons.lock,
                  suffixicon: TextButton(
                    onPressed: () {},
                    child: Text('Show', style: FontManager.textStyle14),
                  ),
                  controller: passwordcontroller,
                  onsave: (value) {},
                  onvalidate: (value) {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: FontManager.textStyle14),
                  ),
                ),
                const CustomButtonWidget(text: 'LOG IN'),
                SizedBox(
                  height: 10.h,
                ),
                CustomQuestionWidget(
                    question: 'Don\'t have an account?',
                    answer: 'SignUp now',
                    onPress: () {
                      Navigation.navigateWithReturnFromRightToLeft(
                          screen: SignUpView(), context: context);
                    })
              ],
            ),
          ),
        ));
  }
}
