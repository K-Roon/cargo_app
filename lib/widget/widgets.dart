import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black26),
      focusColor: Color(0xFF0073FF),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0073FF)),
        borderRadius: BorderRadius.circular(13),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(13),
      ));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 18);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 15);
}

TextStyle smallTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 10);
}