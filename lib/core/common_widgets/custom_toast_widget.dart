import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToastWidget {
  static showSuccessToast({required String text}) {
    Fluttertoast.showToast(msg: text, backgroundColor: Colors.green);
  }
  static showFailureToast({required String text}) {
    Fluttertoast.showToast(msg: text, backgroundColor: Colors.red);
  }
}
