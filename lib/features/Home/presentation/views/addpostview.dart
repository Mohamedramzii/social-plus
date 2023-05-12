import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/home_layout.dart';
import 'package:social_app/features/Home/presentation/views/widgets/addPost_view_Widgets/create_post_body_widget.dart';
import 'package:social_app/features/Home/presentation/views/widgets/addPost_view_Widgets/create_post_header_widget.dart';

import '../../../../core/navigation_manager.dart';

class AddPostView extends StatelessWidget {
  AddPostView({super.key});
  TextEditingController postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CreatePostSuccessState) {
          CustomToastWidget.showSuccessToast(text: 'Posted Successfully');
          Navigation.navigateWithNoReturnFromLeftToRight(
              screen: HomeLayoutView(), context: context);
        }
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        var authCubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Create a post',
              style: FontManager.textStyle20,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (homeCubit.postImageFile == null) {
                    homeCubit.CreateNewPost(context,
                        bodytext: postTextController.text,
                        dateTime: DateTime.now().toString());
                  } else {
                    homeCubit.UploadPostImage(
                      context,
                      bodytext: postTextController.text,
                      dateTime: DateTime.now().toString(),
                    );
                  }
                },
                icon: state is CreatePostLoadingState
                    ? CircularProgressIndicator(
                        color: ColorsManager.primaryColor,
                      )
                    : const Icon(FontAwesomeIcons.solidPaperPlane),
              ),
              SizedBox(
                width: 15.w,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              CreatePostHeader(
                firstname: authCubit.userModel!.firstname!,
                lastname: authCubit.userModel!.lastname!,
                userImage: authCubit.userModel!.image!,
              ),
              SizedBox(
                height: 20.h,
              ),
              CreatePostBodyWidget(
                postBody: postTextController.text,
                controller: postTextController,
              ),
              if (homeCubit.postImageFile != null)
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 350.h,
                        child: Image.file(
                          homeCubit.postImageFile!,
                          fit: BoxFit.cover,
                        )),
                    IconButton(
                        onPressed: () => homeCubit.RemovePostImage(),
                        icon: const Icon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.black,
                          size: 30,
                        ))
                  ],
                ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        homeCubit.GetPostImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        FontAwesomeIcons.solidImages,
                        color: ColorsManager.primaryColor,
                      ),
                      label: Text(
                        'Add Photo',
                        style: FontManager.textStyle14,
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.hashtag,
                        color: ColorsManager.primaryColor,
                      ),
                      label: Text(
                        'tags',
                        style: FontManager.textStyle14,
                      )),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
