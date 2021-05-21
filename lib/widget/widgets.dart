import 'package:flutter/cupertino.dart';
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

InputDecoration textFieldInputDecoration_center(String hintText) {
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

// ignore: non_constant_identifier_names
AppBar appBar_custom(BuildContext context, String title) {
  return AppBar(
    leading: TextButton(
      child: Icon(Icons.arrow_back_ios, color: Colors.black,),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(title),
    automaticallyImplyLeading: true,
    elevation: 0.0,
  );
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

void showErrorAlertDialog(BuildContext context, String errorText) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0.0,
          titlePadding: EdgeInsets.zero,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF0073FF),
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(10))),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                "안내",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
          contentPadding: EdgeInsets.only(top: 10),
          content: Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          actionsPadding: EdgeInsets.all(10),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF0073FF),
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    "확인",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            )
          ],
        );
      });
}