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
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

///textInputDecoration 으로 대체되었다.
@deprecated
InputDecoration textFieldInputDecoration(String hintText) {
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

// ignore: non_constant_identifier_names
AppBar appBar_custom(BuildContext context, String title) {
  return AppBar(
    leading: TextButton(
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
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
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    ),
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0.0,
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

///btnTxtStyle로 대체되었다.
@deprecated
TextStyle buttonTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle btnTxtStyle({Color color}) {
  return TextStyle(color: color != null ? color : Colors.black, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 20);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 15);
}

TextStyle txtStyle_flexible(Color color, double fontSize) {
  return TextStyle(color: color, fontSize: fontSize);
}

TextStyle smallTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 11);
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
                      color: Colors.blue,
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

void showChooseAlertDialog(BuildContext context, String errorText) async {
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
                      color: Colors.blue,
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
                  onPressed: () {
                    print("PUSHED");
                  },
                  child: Icon(
                    Icons.person,
                    size: 50,
                  )),
              Text("   포인트 "),
              Text(
                "  $point 원",
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title:
                    Text('화물차 부르기', style: txtStyle_flexible(Colors.white, 20)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Insert_cargo_info()));
                },
              ),
              ListTile(
                title: Text('화물차 추천받기',
                    style: txtStyle_flexible(Colors.white, 20)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Recommend()));
                },
              ),
              ListTile(
                title:
                    Text('내 운송 조회', style: txtStyle_flexible(Colors.white, 20)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mydeliver()));
                },
              ),
              ListTile(
                title:
                    Text('내 정보 관리', style: txtStyle_flexible(Colors.white, 20)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyInfo()));
                },
              ),
              ListTile(
                title: Text('공지사항', style: txtStyle_flexible(Colors.white, 20)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notice()));
                },
              ),
              ListTile(
                title: Text('고객센터', style: txtStyle_flexible(Colors.white, 20)),
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
                            "1:1 고객 채팅 페이지로 이동합니다.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          actionsPadding: EdgeInsets.symmetric(horizontal: 10),
                          actionsOverflowButtonSpacing: 10,
                          actionsOverflowDirection: VerticalDirection.down,
                          actions: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  alignment: Alignment.center,
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side:
                                      BorderSide(width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  "취소",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side:
                                      BorderSide(width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  "1:1상담",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
              ),
              ListTile(
                title: Text('로그아웃', style: txtStyle_flexible(Colors.white, 20)),
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
                            "접속중인 기기에서 로그아웃 하시겠습니까?",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          actionsPadding: EdgeInsets.symmetric(horizontal: 10),
                          actionsOverflowButtonSpacing: 10,
                          actionsOverflowDirection: VerticalDirection.down,
                          actions: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  alignment: Alignment.center,
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side:
                                      BorderSide(width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  "취소",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthService().signOut();
                                      HelperFunctions.saveUserLoggedInSharedPreference(false);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side:
                                      BorderSide(width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  "로그아웃",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
              ),
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
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentList()));
          },
          child: Text(
            "결제 수단 등록",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
        GestureDetector(
          onTap: () {
            print("결제 수단 등록 버튼누름");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentList()));
          },
          child: Text(
            "등록",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
  );
}
