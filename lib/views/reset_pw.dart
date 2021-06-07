import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassWord extends StatefulWidget {
  final String phoneNum;

  const ResetPassWord(this.phoneNum, {Key key}) : super(key: key);

  @override
  _ResetPassWordState createState() => _ResetPassWordState(this.phoneNum);
}

class _ResetPassWordState extends State<ResetPassWord> {
  final String phoneNum;
  bool isLoading = false;
  String myEmail;

  @override
  void initState() {
    resetMyPw();
    super.initState();
  }

  resetMyPw() async {
    print("GETTING MY Email and Send..");
    QuerySnapshot querySnapshot =
        await DatabaseMethods().getUserInfoWithPhoneNum(this.phoneNum);
    setState(() {
      myEmail = querySnapshot.docs[0].get("email");
      if (myEmail != null) ResetPassword(myEmail);
    });
  }

  _ResetPassWordState(this.phoneNum);

  @override
  Future<void> ResetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: appBarCustom(context, ""),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "비밀번호 초기화",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    "리셋된 비밀번호를 이메일로 보내드렸어요.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(vertical: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black38)),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("계정의 비밀번호를 다음과 같은 메일로 보냈어요.\n" +
                            "${myEmail != null ? myEmail : "LOADING.."}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
