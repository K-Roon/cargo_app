import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/auth.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/views/payment_list.dart';
import 'package:cargo_app/views/signIn.dart';
import 'package:cargo_app/views/submenu/insert_cargo_info.dart';
import 'package:cargo_app/views/submenu/my_deliver.dart';
import 'package:cargo_app/views/submenu/my_info.dart';
import 'package:cargo_app/views/submenu/notice.dart';
import 'package:cargo_app/views/submenu/recommend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

AppBar appBarCustom(BuildContext context, String title) {
  return AppBar(
    leading: TextButton(
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title),
    automaticallyImplyLeading: true,
    elevation: 0.0,
  );
}

AppBar appBarSub(BuildContext context, String title) {
  return AppBar(
    leading: TextButton(
        child: Icon(
          Icons.home_rounded,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context)),
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0.0,
  );
}

TextStyle btnTxtStyle({Color color}) {
  return TextStyle(color: color != null ? color : Colors.black, fontSize: 16);
}

TextStyle biggerTextStyle({Color color}) {
  return TextStyle(color: color != null ? color : Colors.white, fontSize: 20);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 15);
}

TextStyle txtStyleFlexible(Color color, double fontSize) {
  return TextStyle(color: color, fontSize: fontSize);
}

TextStyle smallTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 12);
}

TextStyle smallBoldStyle({Color color}) {
  return TextStyle(
      color: color != null ? color : Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold);
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
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text(
                "??????",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
          contentPadding: EdgeInsets.all(15),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                errorText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(width: 1, color: Colors.blue),
                      ),
                      child: Text(
                        "??????",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container()
                ],
              )
            ],
          ),
        );
      });
}

Widget homeDrawer(BuildContext context) {
  int point = 0;
  return Drawer(
    elevation: 0.0,
    semanticLabel: "FLUTTER",
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  onPressed: () => print("PUSHED"),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  )),
              Text("   ????????? "),
              Text(
                "  $point ???",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  ListTile(
                    title: Text('????????? ?????????',
                        style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InsertCargoInfo())),
                  ),
                  ListTile(
                    title: Text('????????? ????????????',
                        style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Recommend())),
                  ),
                  ListTile(
                    title: Text('??? ?????? ??????',
                        style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyDelivery())),
                  ),
                  ListTile(
                    title: Text('??? ?????? ??????',
                        style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyInfo())),
                  ),
                  ListTile(
                    title:
                        Text('????????????', style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Notice())),
                  ),
                  ListTile(
                    title:
                        Text('????????????', style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              elevation: 0.0,
                              titlePadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10))),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "??????",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              contentPadding: EdgeInsets.all(15),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "1:1 ??????????????? ???????????????.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            side: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          child: Text(
                                            "??????",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            side: BorderSide(
                                                width: 0, color: Colors.blue),
                                          ),
                                          child: Text(
                                            "1:1 ??????",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              ),
              Container(height: 100,),
              Column(
                children: [
                  ListTile(
                    title:
                        Text('????????????', style: txtStyleFlexible(Colors.white, 20)),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              elevation: 0.0,
                              titlePadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10))),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "??????",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              contentPadding: EdgeInsets.all(15),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "???????????? ???????????? ???????????? ???????????????????",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            side: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          child: Text(
                                            "??????",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            AuthService().signOut();
                                            HelperFunctions
                                                .saveUserLoggedInSharedPreference(
                                                    false);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignIn()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            side: BorderSide(
                                                width: 0, color: Colors.blue),
                                          ),
                                          child: Text(
                                            "????????????",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget paymentTool(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaymentList())),
          child: Text(
            "?????? ?????? ??????",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaymentList())),
          child: Text(
            "??????",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
  );
}
