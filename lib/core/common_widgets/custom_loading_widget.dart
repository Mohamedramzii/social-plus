import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:social_app/core/app_manager/colors/colors_manager.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.newtonCradle(
      color: ColorsManager.primaryColor,
      size: 90,
    );
  }
}
