import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  String myName = "홍길동(TEST)";
  bool _receiveEmail = false;
  bool _receiveSMS = false;
  String userID = "umjunsik";
  String userEmail = "honggilldong@kroon.kr";
  String userPhoneNum = "01000000000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_sub(context, ""),
      body: Container(
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
              myName == null ? "(LOADING..)" : myName,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 10,
            ),
            Text(
              "계정 정보",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.black26)),
                child: Table(
                  columnWidths: {0: FractionColumnWidth(.3),1: FractionColumnWidth(.6),2: FractionColumnWidth(.1)},
                  children: [
                    TableRow(
                      children: [
                        Text(
                          "아이디 : ",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          userID != null ? userID : "LOADING..",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black),
                        ),
                        Container()
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
                          userEmail != null ? userEmail : "LOADING..",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black),
                        ),
                        Container()
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
                          userPhoneNum != null ? userPhoneNum : "LOADING..",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black),
                        ),
                        Container()
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Container(
              height: 10,
            ),
            Text(
              "마케팅 정보 수신 동의",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
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
                        _receiveEmail = !_receiveEmail;
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
                            value: _receiveEmail,
                            onChanged: (bool value) {
                              setState(() {
                                _receiveEmail = value;
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
                        _receiveSMS = !_receiveSMS;
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
                            value: _receiveSMS,
                            onChanged: (bool value) {
                              setState(() {
                                _receiveSMS = value;
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
    );
  }
}
