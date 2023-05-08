import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/core/common_widgets/custom_loading_widget.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/editProfile_view.dart';
import 'package:social_app/features/Home/presentation/views/widgets/settings_widgets/bio_widget.dart';
import 'package:social_app/features/Home/presentation/views/widgets/settings_widgets/profile_image_widget.dart';
import 'package:social_app/features/Home/presentation/views/widgets/settings_widgets/username_widget.dart';

import '../../../../core/constants.dart';
import '../../../../core/navigation_manager.dart';
import 'widgets/settings_widgets/cover_profile_images_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile',
              style: FontManager.textStyle20
                  .copyWith(color: ColorsManager.primaryColor)),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<AuthCubit>(context);
            var homecubit = BlocProvider.of<HomeCubit>(context);
            if (state is GetUserDataSuccessState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        CoverImageWidget(
                            isOut: false,
                            cover: cubit.userModel!.cover!,
                            isInEdit: false,
                            coverImage: homecubit.CoverImage),
                        ProfileImageWidget(
                          image: cubit.userModel!.image!,
                          isInEdit: false,
                          profileImage: homecubit.profileImage,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  UserNameWidget(
                    cubit: cubit,
                    isInEdit: false,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BioWidget(
                    cubit: cubit,
                    isInEdit: false,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidEnvelope,
                          size: 15,
                          color: ColorsManager.primaryColor,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(cubit.userModel!.email!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.phoneVolume,
                          size: 15,
                          color: ColorsManager.primaryColor,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(cubit.userModel!.phone!),
                      ],
                    ),
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white),
                              child: Text(
                                'Your photos',
                                style: FontManager.textStyle14bk,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            isExit=true;
                            print(isExit);
                            Navigation.navigateWithNoReturnFromLRightToLeft(
                                screen: EditProfileView(), context: context);
                          },
                          child: Container(
                            width: 60.w,
                            height: 35.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white),
                            child: const Icon(FontAwesomeIcons.penToSquare),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CustomLoadingWidget());
            }
          },
        ));
  }
}
