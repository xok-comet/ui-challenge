import 'package:flutter/material.dart';

class TextCategory extends StatelessWidget {
  final String text;
  TextCategory({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff4652AF),
            fontSize: 12));
  }
}
