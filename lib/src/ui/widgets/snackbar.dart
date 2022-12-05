import 'package:flutter/material.dart';

void snackBar(
  BuildContext context, {
  required String content,
  int milliseconds = 2000,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(milliseconds: milliseconds), // 700
  ));
}
