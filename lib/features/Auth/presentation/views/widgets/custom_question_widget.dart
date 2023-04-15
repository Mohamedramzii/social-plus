import 'package:flutter/material.dart';

import '../../../../../core/app_manager/font/fonts_manager.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({
    Key? key,
    required this.question,
    required this.answer,
    required this.onPress,
  }) : super(key: key);


final String question;
final String answer;
final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          question,
          style: FontManager.textStyle14,
        ),
        TextButton(
          onPressed: () {
            onPress();
          },
          child: Text(
            answer,
            style: FontManager.textStyle14.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
