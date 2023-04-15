import 'package:flutter/material.dart';

import '../app_manager/assets/images_manager.dart';
import '../app_manager/colors/colors_manager.dart';
import '../app_manager/font/fonts_manager.dart';

class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImageManager.addLogo,
              width: 80,
              color: ColorsManager.primaryColor,
            )),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'SOCiAL', style: FontManager.textStyle45),
              const TextSpan(
                text: '  ',
              ),
              TextSpan(text: 'plus+', style: FontManager.textStyle20),
            ],
          ),
        )
      ],
    );
  }
}
