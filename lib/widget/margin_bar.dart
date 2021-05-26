import 'package:flutter/material.dart';

class MarginBar {
  static Container marginBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      height: 0.5,
    );
  }

  static Container bold(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      height: 2.0,
    );
  }
}
