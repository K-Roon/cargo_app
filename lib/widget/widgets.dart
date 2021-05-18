import 'package:cargo_app/widget/fieldBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black26),
      focusColor: Color(0xFF0073FF),
      focusedBorder: FieldBorder.focused(),
      enabledBorder: FieldBorder.enabled());
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle formTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
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
