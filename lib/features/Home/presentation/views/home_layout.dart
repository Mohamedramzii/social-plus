import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/core/common_widgets/custom_toast_widget.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';
import 'package:social_app/features/Home/presentation/views/settingsView.dart';
import 'package:social_app/features/Home/presentation/views/usersView.dart';

import '../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../core/navigation_manager.dart';
import 'chatsView.dart';
import 'feedsView.dart';
import 'notificationsView.dart';

class HomeLayoutView extends StatelessWidget {
  HomeLayoutView({super.key});

  List<Tab> tabs = [
    const Tab(
      icon: Icon(FontAwesomeIcons.houseUser),
    ),
    const Tab(
      icon: Icon(FontAwesomeIcons.comments),
    ),
    const Tab(
      icon: Icon(FontAwesomeIcons.bell),
    ),
    const Tab(
      icon: Icon(FontAwesomeIcons.userGroup),
    ),
    // const Tab(
    //   icon: Icon(FontAwesomeIcons.gears),
    // ),
  ];

  List<Widget> screens = [
     FeedsView(),
    const ChatsView(),
    const NotificationsView(),
    const UsersView(),
    // const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Social+',
              style: FontManager.textStyle20.copyWith(
                  color: ColorsManager.primaryColor,
                  fontWeight: FontWeight.w900),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.searchengin,
                    color: ColorsManager.primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigation.navigateWithReturnFromRightToLeft(
                        screen: const SettingsView(), context: context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.gears,
                    color: ColorsManager.primaryColor,
                  )),
            ],
          ),
          body: Column(
            children: [
              TabBar(
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                tabs: tabs,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: ColorsManager.primaryColor,
                unselectedLabelColor: Colors.purple[100],
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: screens,
                ),
              )
            ],
          )),
    );
  }
}
