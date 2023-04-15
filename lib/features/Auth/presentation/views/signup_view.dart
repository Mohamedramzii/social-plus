import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/features/Auth/presentation/views/login_view.dart';

import '../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../core/common_widgets/custom_logo_widget.dart';
import '../../../../core/navigation_manager.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/custom_greeting_widget.dart';
import 'widgets/custom_question_widget.dart';
import 'widgets/custom_textFormField_widget.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController fNamecontroller = TextEditingController();
  TextEditingController lNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigation.pop(screen: LoginView(), context: context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                  color: ColorsManager.primaryColor)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                const CustomLogoWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: const CustomGreetingWidget(
                    text1: 'Let\'s build your network',
                    text2: 'Register Now!',
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFieldWidget(
                        title: 'First Name',
                        hinttext: 'Muhammed',
                        controller: fNamecontroller,
                        icon: Icons.person,
                        onsave: (value) {},
                        onvalidate: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Expanded(
                      child: CustomTextFormFieldWidget(
                        title: 'Last Name',
                        hinttext: 'Ramzy',
                        icon: Icons.person,
                        controller: lNamecontroller,
                        onsave: (value) {},
                        onvalidate: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
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
                SizedBox(
                  height: 20.h,
                ),
                const CustomButtonWidget(text: 'SIGN UP'),
                SizedBox(
                  height: 10.h,
                ),
                CustomQuestionWidget(
                  question: 'Already have an account?',
                  answer: 'Login now',
                  onPress: () {
                    Navigation.navigateWithNoReturnFromLeftToRight(
                        screen: LoginView(), context: context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
