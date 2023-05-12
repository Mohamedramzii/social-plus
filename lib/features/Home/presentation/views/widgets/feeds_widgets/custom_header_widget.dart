import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    Key? key,
    required this.userImage,
    required this.firstname,
    required this.lastname,
    required this.date,
  }) : super(key: key);
  final String userImage;
  final String firstname;
  final String lastname;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 27,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(userImage),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$firstname $lastname',
                  style: FontManager.textStyle14bk,
                ),
                SizedBox(
                  width: 3.w,
                ),
                const Icon(FontAwesomeIcons.solidCircleCheck,
                    size: 15, color: Colors.blue)
              ],
            ),
            Text(
              date,
              style: FontManager.textStyle14gry,
            ),
          ],
        )),
        IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.ellipsis)),
      ],
    );
  }
}
