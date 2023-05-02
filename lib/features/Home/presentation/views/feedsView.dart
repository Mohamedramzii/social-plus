import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'widgets/feeds_widget/CUSTOM_POST_WIDGET.dart';

class FeedsView extends StatelessWidget {
  FeedsView({super.key});

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const CustomPostWidget(),
        ),
        floatingActionButton: ScrollingFabAnimated(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          text: const Text(
            'Add a post',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          color: ColorsManager.primaryColor,
          width: 133.w,
          // radius: 60,
          // limitIndicator: 40,
          onPress: () {},
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
        ));
  }
}
