import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomAddCommentLikeWidget extends StatelessWidget {
  const CustomAddCommentLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/premium-photo/young-caucasian-man-isolated-pink-background-counting-one-with-serious-expression_1368-354701.jpg?size=626&ext=jpg',
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: (){
            print('pressed');
          },
          child: Text(
            'Write a comment ...',
            style: FontManager.textStyle14gry,
          ),
        ),
        const Spacer(),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.heart,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Like',
                  style: FontManager.textStyle14gry,
                ),
              ],
            ))
      ],
    );
  }
}
