import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_PostBody_widget.dart';
import 'custom_addcommentLike_widget.dart';
import 'custom_header_widget.dart';
import 'custom_postImage_widget.dart';
import 'custom_postReacts_widget.dart';
import 'custom_postTages_widgte.dart';

class CustomPostWidget extends StatelessWidget {
  const CustomPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            elevation: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post Header
                  const CustomHeaderWidget(),
                  SizedBox(
                    height: 15.h,
                  ),
                  //Post body
                  const CustomPostBodyWidget(),
                  // Post tags
                  const CustomPostTagsWidget(),
                  // Post Image
                  const CustomPostImageWidget(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomPostReactsWidget(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    height: 5,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const CustomAddCommentLikeWidget(),
                ],
              ),
            ))
      ],
    );
    ;
  }
}
