import 'package:flutter/material.dart';

class TextInputDeco {
  static InputDecoration defaultValue(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ));
  }

  static InputDecoration defaultPassword(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ));
  }

  static InputDecoration payment(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(5),
        ));
  }

  static InputDecoration search(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        filled: true,
        fillColor: Colors.black12,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 0),
          borderRadius: BorderRadius.circular(10),
        ));
  }

  static InputDecoration radiusHard(String hintText, {Icon icon}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        suffixIcon: icon,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(5),
        ),);
  }

  static InputDecoration defaultCenter(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ));
  }

  static InputDecoration underline(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        suffixIcon: Icon(Icons.search, size: 20),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ));
  }

  static InputDecoration square(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        focusColor: Colors.blue,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(0),
        ));
  }


}