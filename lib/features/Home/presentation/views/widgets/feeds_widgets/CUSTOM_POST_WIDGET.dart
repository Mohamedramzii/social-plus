import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_PostBody_widget.dart';
import 'custom_addcommentLike_widget.dart';
import 'custom_header_widget.dart';
import 'custom_postImage_widget.dart';
import 'custom_postReacts_widget.dart';
import 'custom_postTages_widgte.dart';

class CustomPostWidget extends StatelessWidget {
  const CustomPostWidget({
    Key? key,
    required this.userImage,
    required this.firstname,
    required this.lastname,
    required this.date,
    required this.postBodyText,
    required this.postImage,
  }) : super(key: key);
  final String userImage;
  final String firstname;
  final String lastname;
  final String date;
  final String postBodyText;
  final String postImage;

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
                  CustomHeaderWidget(
                      userImage: userImage,
                      firstname: firstname,
                      lastname: lastname,
                      date: date),
                  SizedBox(
                    height: 15.h,
                  ),
                  //Post body
                   CustomPostBodyWidget(postBodyText:postBodyText),

                  // Post tags
                  const CustomPostTagsWidget(),
                  // Post Image
                   Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: CustomPostImageWidget(
                      postImage:postImage
                    ),
                  ),
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
