import 'package:flutter/material.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';
import '../../../../../Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';

class BioWidget extends StatelessWidget {
  const BioWidget({
    Key? key,
    required this.cubit,
    required this.isInEdit,
  }) : super(key: key);
final AuthCubit cubit;
final bool isInEdit;
  @override
  Widget build(BuildContext context) {
    return Text(
                    cubit.userModel!.bio!,
                    style: FontManager.textStyle14gry,
                  );
  }
}
