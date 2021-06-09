import 'package:cargo_app/helper/constants.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/submenu/change_my_info_email.dart';
import 'package:cargo_app/views/submenu/change_my_info_phone.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 나의 개인정보와 마케팅에 대한 동의를 변경할 수 있는 화면입니다.
class MyInfo extends StatefulWidget {
  const MyInfo({Key key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  void initState() {
    getMyInfo();
    super.initState();
  }

  void getMyInfo() async {
    QuerySnapshot querySnapshot =
        await DatabaseMethods().getUserInfoDB(Constants.myId.toString());
    setState(() {
      Constants.userEmail = querySnapshot.docs[0].get("email");
      Constants.userPhoneNum = querySnapshot.docs[0].get("phonenum");
      Constants.receiveEmail = querySnapshot.docs[0].get("marketing_Email");
      Constants.receiveSMS = querySnapshot.docs[0].get("marketing_SMS");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSub(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "내 정보 관리",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                height: 10,
              ),
              Text(
                Constants.myName == null ? "(LOADING..)" : Constants.myName,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                height: 10,
              ),
              Text(
                "계정 정보",
                textAlign: TextAlign.left,
                style: smallBoldStyle(),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.black26)),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: FractionColumnWidth(.3),
                      1: FractionColumnWidth(.6),
                      2: FractionColumnWidth(.1)
                    },
                    children: [
                      TableRow(
                        children: [
                          Text(
                            "아이디 : ",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            Constants.myId != "" ? Constants.myId : "LOADING..",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () => print("ID"), child: Container()),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "이메일 : ",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            Constants.userEmail != ""
                                ? Constants.userEmail
                                : "LOADING..",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeMyEmail(
                                          Constants.userEmail != ""
                                              ? Constants.userEmail
                                              : false))),
                              child: Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "전화번호 : ",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            Constants.userPhoneNum != ""
                                ? Constants.userPhoneNum
                                : "LOADING..",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeMyPhone(
                                          Constants.userPhoneNum != ""
                                              ? Constants.userPhoneNum
                                              : "LOADING.."))),
                              child: Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ],
                  )),
              Container(
                height: 10,
              ),
              Text(
                "결제 수단",
                textAlign: TextAlign.left,
                style: smallBoldStyle(),
              ),
              paymentTool(context),
              Container(
                height: 15,
              ),
              Text(
                "마케팅 정보 수신 동의",
                textAlign: TextAlign.left,
                style: smallBoldStyle(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.black26)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Constants.receiveEmail = !Constants.receiveEmail;
                          DatabaseMethods().changeNewInfoBool(
                              "marketing_Email", Constants.receiveEmail);
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '이메일',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                          Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              value: Constants.receiveEmail,
                              onChanged: (bool value) {
                                setState(() {
                                  Constants.receiveEmail = value;
                                  DatabaseMethods().changeNewInfoBool(
                                      "marketing_Email",
                                      Constants.receiveEmail);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Constants.receiveSMS = !Constants.receiveSMS;
                          DatabaseMethods().changeNewInfoBool(
                              "marketing_SMS", Constants.receiveSMS);
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '문자',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                          Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              value: Constants.receiveSMS != null
                                  ? Constants.receiveSMS
                                  : false,
                              onChanged: (bool value) {
                                setState(() {
                                  Constants.receiveSMS = value;
                                  DatabaseMethods().changeNewInfoBool(
                                      "marketing_SMS", Constants.receiveSMS);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
