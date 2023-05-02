import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/core/helpers/cache_helper.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Auth/presentation/views/login_view.dart';
import 'package:social_app/features/Home/presentation/views/home_layout.dart';

import '../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../core/navigation_manager.dart';
import 'widgets/custom_greeting_widget.dart';
import 'widgets/custom_question_widget.dart';
import 'widgets/custom_textFormField_widget.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController fNamecontroller = TextEditingController();
  TextEditingController lNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigation.pop(screen: LoginView(), context: context);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    color: ColorsManager.primaryColor)),
          ),
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterFailureState) {
                CustomToastWidget.showFailureToast(text: state.errMessage);
              }
              // else if (state is RegisterSuccessState) {
              //   CustomToastWidget.showSuccessToast(text: 'Welcome 😊');
              // }

              if (state is UserDataCreatedSuccessState) {
                CacheHelper.saveData(key: 'uID', value: state.uID)
                    .then((value) {
                  CustomToastWidget.showSuccessToast(text: 'Welcome 😊');
                  Navigation.navigateWithNoReturnFromLRightToLeft(
                      screen:  HomeLayoutView(), context: context);
                });
              }
            },
            builder: (context, state) {
              AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // const CustomLogoWidget(),
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
                                inputaction: TextInputAction.next,
                                isPassword: false,
                                keyboardtype: TextInputType.name,
                                title: 'First Name',
                                hinttext: 'Muhammed',
                                controller: fNamecontroller,
                                icon: Icons.person,
                                onsave: (value) {
                                  fNamecontroller.text = value!;
                                },
                                onvalidate: (value) {
                                  if (value!.isEmpty || value.length < 3) {
                                    return 'Please enter a valid first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Expanded(
                              child: CustomTextFormFieldWidget(
                                inputaction: TextInputAction.next,
                                isPassword: false,
                                keyboardtype: TextInputType.name,
                                title: 'Last Name',
                                hinttext: 'Ramzy',
                                icon: Icons.person,
                                controller: lNamecontroller,
                                onsave: (value) {
                                  lNamecontroller.text = value!;
                                },
                                onvalidate: (value) {
                                  if (value!.isEmpty || value.length < 3) {
                                    return 'Please enter a valid last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
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
                          inputaction: TextInputAction.next,
                          isPassword: false,
                          keyboardtype: TextInputType.number,
                          title: 'Phone Number',
                          hinttext: 'enter your phone number',
                          icon: Icons.phone_android,
                          controller: phonecontroller,
                          onsave: (value) {
                            phonecontroller.text = value!;
                          },
                          onvalidate: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return 'enter a valid phone number';
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! RegisterLoadingState,
                          widgetBuilder: (context) => MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                cubit.registerUser(
                                    phone: phonecontroller.text,
                                    firstname: fNamecontroller.text,
                                    lastname: lNamecontroller.text,
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
                              'SIGN UP',
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
                ),
              );
            },
          )),
    );
  }
}
