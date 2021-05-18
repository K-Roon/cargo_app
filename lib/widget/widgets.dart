import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black26),
      focusColor: Color(0xFF0073FF),
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0073FF)),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle buttonTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 20);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 15);
}

TextStyle smallTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 10);
}