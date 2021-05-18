import 'package:flutter/material.dart';

class FieldBorder {
  static OutlineInputBorder focused() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF0073FF)),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static OutlineInputBorder enabled() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
