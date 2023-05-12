// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CreatePostBodyWidget extends StatelessWidget {
  CreatePostBodyWidget({
    Key? key,
    this.postBody,
    required this.controller
  }) : super(key: key);
  String? postBody;
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          print(value);
          postBody = value;
        },
        maxLines: 15,
        // maxLength: 2000,
        decoration: const InputDecoration(
          hintText: 'What\'s on your mind ...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
