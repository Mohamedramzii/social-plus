import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/common_widgets/custom_loading_widget.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/addpostview.dart';
import '../../../../core/navigation_manager.dart';
import 'widgets/feeds_widgets/CUSTOM_POST_WIDGET.dart';

class FeedsView extends StatelessWidget {
  FeedsView({super.key});

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllPosts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          var authCubit = BlocProvider.of<AuthCubit>(context);
          if (state is GetPostsSuccessState) {
            return Scaffold(
                body: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeCubit.posts.length,
                  itemBuilder: (context, index) => CustomPostWidget(
                    userImage: authCubit.userModel!.image!,
                    firstname: authCubit.userModel!.firstname!,
                    lastname: authCubit.userModel!.lastname!,
                    date: homeCubit.posts[index].dateTime!,
                    postBodyText: homeCubit.posts[index].bodytext!,
                    postImage: homeCubit.posts[index].postImage!,
                  ),
                ),
                floatingActionButton: ScrollingFabAnimated(
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                  text: const Text(
                    'Add a post',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  color: ColorsManager.primaryColor,
                  width: 135.w,
                  // radius: 60,
                  // limitIndicator: 40,
                  onPress: () {
                    // CacheHelper.clearData(key: 'uID');
                    Navigation.navigateWithReturnFromRightToLeft(
                        screen: AddPostView(), context: context);
                  },
                  scrollController: _scrollController,
                  animateIcon: true,
                  inverted: false,
                ));
          } else if (state is GetPostsFailureState) {
            return Center(child: Text(state.errMessage));
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
