import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomPostReactsWidget extends StatelessWidget {
  const CustomPostReactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.heart,
              size: 20,
              color: Colors.grey,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              '1246 Likes',
              style: FontManager.textStyle14gry,
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.comment,
              size: 20,
              color: Colors.grey,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              '1246 comments',
              style: FontManager.textStyle14gry,
            )
          ],
        ),
      ],
    );
  }
}
