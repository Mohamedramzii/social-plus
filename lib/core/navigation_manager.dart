import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

int delayTime = 300;

abstract class Navigation {
  static navigateWithNoReturnFromLeftToRight(
      {required Widget screen, required context}) {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: screen,
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: delayTime)));
  }

  static navigateWithNoReturnFromLRightToLeft(
      {required Widget screen, required context}) {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: screen,
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: delayTime)));
  }

  static navigateWithReturnFromLeftToRight(
      {required Widget screen, required context}) {
    Navigator.push(
        context,
        PageTransition(
            child: screen,
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: delayTime)));
  }

  static navigateWithReturnFromRightToLeft(
      {required Widget screen, required context}) {
    Navigator.push(
        context,
        PageTransition(
            child: screen,
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: delayTime)));
  }

  static pop({required Widget screen, required context}) {
    Navigator.pop(
        context,
        PageTransition(
            child: screen,
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: delayTime)));
  }
}
