import 'package:flutter/material.dart';

class CustomPostImageWidget extends StatelessWidget {
  const CustomPostImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        'https://img.freepik.com/premium-photo/young-caucasian-man-isolated-pink-background-making-stop-gesture-with-her-hand-stop-act_1368-347241.jpg?size=626&ext=jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
