import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/app_manager/assets/images_manager.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/core/common_widgets/custom_loading_widget.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings',
              style: FontManager.textStyle20
                  .copyWith(color: ColorsManager.primaryColor)),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<AuthCubit>(context);
            if (state is GetUserDataSuccessState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                          child: SizedBox(
                            height: 160.h,
                            width: double.infinity,
                            child: Image.network(
                              cubit.userModel!.cover!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100.w,
                          bottom: -50,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 70,
                                //! i added a null check just for test as i did not add an image in firebase firestore
                                backgroundImage: cubit.userModel!.image!.isEmpty
                                    ? const NetworkImage(
                                        'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?size=626&ext=jpg',
                                      )
                                    : NetworkImage(cubit.userModel!.image!)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    '${cubit.userModel!.firstname} ${cubit.userModel!.lastname}',
                    style: FontManager.textStyle20bk,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    cubit.userModel!.bio!,
                    style: FontManager.textStyle14gry,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Posts',
                                style: FontManager.textStyle20p,
                              ),
                              Text(
                                '10',
                                style: FontManager.textStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Friends',
                                style: FontManager.textStyle20p,
                              ),
                              Text(
                                '110',
                                style: FontManager.textStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Followers',
                                style: FontManager.textStyle20p,
                              ),
                              Text(
                                '25K',
                                style: FontManager.textStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Following',
                                style: FontManager.textStyle20p,
                              ),
                              Text(
                                '8',
                                style: FontManager.textStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 8.w),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      ),
                      onPressed: () {},
                      color: ColorsManager.primaryColor,
                      child: Text(
                        'EDIT PROFILE',
                        style: FontManager.textStyle20bk.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CustomLoadingWidget());
            }
          },
        ));
  }
}
