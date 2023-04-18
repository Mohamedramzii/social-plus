import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginFailureState) {
                CustomToastWidget.showFailureToast(text: state.errMessage);
              } else if (state is LoginSuccessState) {
                CustomToastWidget.showSuccessToast(
                    text: 'Logged-in Successfully');
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<AuthCubit>(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Form(
                    key: _formKey,
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
                          inputaction: TextInputAction.next,
                          isPassword: false,
                          keyboardtype: TextInputType.emailAddress,
                          title: 'Email Address',
                          hinttext: 'example@gmail.com',
                          icon: Icons.email,
                          controller: emailcontroller,
                          onsave: (value) {
                            emailcontroller.text = value!;
                          },
                          onvalidate: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormFieldWidget(
                          inputaction: TextInputAction.done,
                          isPassword: cubit.isHidden ? true : false,
                          keyboardtype: TextInputType.visiblePassword,
                          title: 'Password',
                          hinttext: 'enter at least 8 characters',
                          icon: Icons.lock,
                          suffixicon: TextButton(
                            style: const ButtonStyle(
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              cubit.changeVisibility();
                            },
                            child: Text(cubit.isHidden ? 'Show' : 'Hide',
                                style: FontManager.textStyle14),
                          ),
                          controller: passwordcontroller,
                          onsave: (value) {
                            passwordcontroller.text = value!;
                          },
                          onvalidate: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?',
                                style: FontManager.textStyle14),
                          ),
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! LoginLoadingState,
                          widgetBuilder: (context) => MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                cubit.userLogin(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                              }
                            },
                            minWidth: double.infinity,
                            height: 45.h,
                            color: ColorsManager.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'LOG IN',
                              style: FontManager.textStyle20.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          fallbackBuilder: (context) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorsManager.primaryColor,
                              ),
                            );
                          },
                        ),
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
                ),
              );
            },
          )),
    );
  }
}
