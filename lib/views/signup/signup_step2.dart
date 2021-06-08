import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/signup/signup_step3.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignUpStep2 extends StatefulWidget {
  final String phoneNum;
  final String purpose;
  final bool marketing;

  SignUpStep2(this.phoneNum, this.purpose, this.marketing);

  @override
  _SignUpStep2State createState() =>
      _SignUpStep2State(phoneNum, purpose, marketing);
}

class _SignUpStep2State extends State<SignUpStep2> {
  final String phone;
  final String purpose;
  final bool marketing;
  TextEditingController name = new TextEditingController();
  TextEditingController identify = new TextEditingController();
  TextEditingController email = new TextEditingController();

  bool isLoading = false;

  _SignUpStep2State(this.phone, this.purpose, this.marketing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, ""),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "회원 정보 입력\n",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Container(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "이름",
                          style: mediumTextStyle(),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          height: 10,
                        ),
                        TextField(
                          decoration: TextInputDeco.defaultValue("이름"),
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                          textInputAction: TextInputAction.next,
                          controller: name,
                          keyboardType: TextInputType.text,
                        ),
                        Container(
                          height: 15,
                        ),
                        Text(
                          "아이디",
                          style: mediumTextStyle(),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          height: 10,
                        ),
                        TextField(
                          decoration: TextInputDeco.defaultValue("아이디"),
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                          textInputAction: TextInputAction.next,
                          controller: identify,
                          keyboardType: TextInputType.text,
                        ),
                        Container(
                          height: 15,
                        ),
                        Text(
                          "이메일 주소",
                          style: mediumTextStyle(),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          height: 10,
                        ),
                        TextField(
                          decoration: TextInputDeco.defaultValue("이메일 주소"),
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                          textInputAction: TextInputAction.go,
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () => confirm(this.purpose),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "확인",
              style: biggerTextStyle(),
            )),
      ),
    );
  }

  Future<void> confirm(purpose) async {
    setState(() {
      isLoading = true;
    });
    if (name.text.isEmpty) {
      showErrorAlertDialog(context, "이름을 입력해주세요.");
    } else if (identify.text.isEmpty) {
      showErrorAlertDialog(context, "아이디를 입력해주세요.");
    } else if (email.text.isEmpty) {
      showErrorAlertDialog(context, "이메일를 입력해주세요.");
    } else {
      await DatabaseMethods().getDuplicateId(identify.text).then((value) {
        if (value == null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpStep3(purpose, name.text,
                      identify.text, email.text, phone, marketing)));
        } else {
          showErrorAlertDialog(context, "아이디가 중복되는 것 같습니다.");
          identify.text = "";
        }
      });
    }
    isLoading = false;
  }
}
