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

  static Container marginBarGrey(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
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

  static Container greyBold(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      height: 2.0,
    );
  }
}
