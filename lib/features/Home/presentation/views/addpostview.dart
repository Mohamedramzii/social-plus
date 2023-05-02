import 'package:flutter/material.dart';
import 'package:social_app/core/app_manager/font/fonts_manager.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a post',
          style: FontManager.textStyle20,
        ),
      ),
    );
  }
}
