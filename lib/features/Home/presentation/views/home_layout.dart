import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';
import 'package:social_app/features/Home/presentation/views/settingsView.dart';
import 'package:social_app/features/Home/presentation/views/usersView.dart';

import '../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../core/navigation_manager.dart';
import '../../../Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
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
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
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
                      icon: Hero(
                        tag: 'profileImage',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(cubit.userModel?.image ??
                              'https://img.freepik.com/free-photo/galaxy-nature-aesthetic-background-starry-sky-mountain-remixed-media_53876-126761.jpg?w=996&t=st=1683061690~exp=1683062290~hmac=7e3bf6c60535f057515b91ccb57479d91753853ab94137781091e6e836ac0d8f'),
                        ),
                      )),
                  SizedBox(
                    width: 5.w,
                  ),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: screens,
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
