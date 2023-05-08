import 'package:flutter/material.dart';

import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    Key? key,
    required this.cubit,
    required this.isInEdit,
  }) : super(key: key);
final AuthCubit cubit;
final bool isInEdit;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${cubit.userModel!.firstname} ${cubit.userModel!.lastname}',
      style: FontManager.textStyle20bk,
    );
  }
}
