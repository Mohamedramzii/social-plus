import 'package:flutter/material.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomPostBodyWidget extends StatelessWidget {
  const CustomPostBodyWidget({
    Key? key,
    required this.postBodyText,
  }) : super(key: key);
  final String postBodyText;
  @override
  Widget build(BuildContext context) {
    return Text(
      postBodyText,
      style: FontManager.textStylepostBody,
    );
  }
}
