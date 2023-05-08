import 'package:flutter/material.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomPostBodyWidget extends StatelessWidget {
  const CustomPostBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software',
      style: FontManager.textStylepostBody,
    );
  }
}
