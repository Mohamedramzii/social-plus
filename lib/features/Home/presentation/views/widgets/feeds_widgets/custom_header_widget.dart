import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/app_manager/font/fonts_manager.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?size=626&ext=jpg'),
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
                  'Muhammed Ramzy',
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
              'January 21,2021 at 11:00 pm',
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
