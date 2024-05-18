import 'package:flutter/material.dart';

class Snacbar {
  static customSnack(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: Text(
          message,
        )));
  }
}
