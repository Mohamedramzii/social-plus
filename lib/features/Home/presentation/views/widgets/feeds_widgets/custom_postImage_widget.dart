import 'package:flutter/material.dart';

class CustomPostImageWidget extends StatelessWidget {
  const CustomPostImageWidget({
    Key? key,
    required this.postImage,
  }) : super(key: key);
  final String postImage;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: postImage == ''
          ? Container()
          : Image.network(
              postImage,
              fit: BoxFit.cover,
            ),
    );
  }
}
