import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: HexColor('EA4C89'),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 100,),
                Expanded(
                  child: Container(
                    // height: ,
                        width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
