import 'package:flutter/material.dart';

import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomGreetingWidget extends StatelessWidget {
  const CustomGreetingWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: FontManager.textStyle20,
        ),
        Text(
          text2,
          style: FontManager.textStyle20,
        ),
      ],
    );
  }
}
