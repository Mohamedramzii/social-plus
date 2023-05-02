import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPostTagsWidget extends StatelessWidget {
  const CustomPostTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: SizedBox(
              height: 25.h,
              // width: double.infinity,
              child: MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 1.w,
                  onPressed: () {},
                  child: const Text(
                    '#Software',
                    style: TextStyle(color: Colors.blue),
                  ))),
        ),
      ],
    );
  }
}
