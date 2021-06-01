import 'dart:math';

import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignUp_Step3 extends StatefulWidget {
  final String purpose;
  final String name;
  final String id;
  final String email;
  final String phone_number;
  final String biz_num;

  SignUp_Step3(this.purpose, this.name, this.id, this.email, this.phone_number,
      this.biz_num);

  @override
  _SignUp_Step3State createState() => _SignUp_Step3State(this.purpose,
      this.name, this.id, this.email, this.phone_number, this.biz_num);
}

class _SignUp_Step3State extends State<SignUp_Step3> {
  final String purpose;
  final String name;
  final String id;
  final String email;
  final String phone_number;
  final String biz_num;

  final pwRegister_FormKey = GlobalKey<FormState>();
  TextEditingController pw = new TextEditingController();
  TextEditingController pw_confirm = new TextEditingController();

  bool isLoading = false;
  bool isAvailable = false;

  _SignUp_Step3State(this.purpose, this.name, this.id, this.email,
      this.phone_number, this.biz_num);

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  signIn() async {
    if (idController.text.isEmpty) {
      showErrorAlertDialog(context, "ID를 입력해주세요");
    } else if (passwordController.text.isEmpty) {
      showErrorAlertDialog(context, "비밀번호를 입력해주세요");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, ""),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "회원 정보 입력\n",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 10,
            ),
            Form(
              key: pwRegister_FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "비밀번호 입력",
                    style: mediumTextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: textFieldInputDecoration("비밀번호"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.next,
                    controller: pw,
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: textFieldInputDecoration("비밀번호 확인"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.next,
                    controller: pw_confirm,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Confirm();
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff0055ff),
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "확인",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  void Confirm() {
    if (pw.text.isEmpty) {
      showErrorAlertDialog(context, "비밀번호를 입력해주세요.");
    } else if (pw.text != pw_confirm.text) {
      showErrorAlertDialog(context, "비밀번호 확인란과 동일하지 않습니다.");
    } else {
      SignupMember();
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
                "회원가입이 성공적으로\n완료되었습니다.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              actionsPadding: EdgeInsets.all(10),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
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
  }
}

/// 여기에 회원정보등록 입력.
void SignupMember() {}
