import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/views/signup/signup_step3.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignUp_Step2 extends StatefulWidget {
  final String phone_num;
  SignUp_Step2(this.phone_num);

  @override
  _SignUp_Step2State createState() => _SignUp_Step2State(phone_num);
}

class _SignUp_Step2State extends State<SignUp_Step2> {
  final register_FormKey = GlobalKey<FormState>();
  final String phone;
  TextEditingController name = new TextEditingController();
  TextEditingController identify = new TextEditingController();
  TextEditingController email = new TextEditingController();

  bool isLoading = false;
  bool isAvailable = false;

  _SignUp_Step2State(this.phone);

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
              key: register_FormKey,
              child: Column(
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
                  TextFormField(
                    decoration: textFieldInputDecoration("이름"),
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
                  TextFormField(
                    decoration: textFieldInputDecoration("아이디"),
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
                  TextFormField(
                    decoration: textFieldInputDecoration("이메일 주소"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.go,
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                  )
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
    if (name.text.isEmpty) {
      showErrorAlertDialog(context, "이름을 입력해주세요.");
    } else if (identify.text.isEmpty) {
      showErrorAlertDialog(context, "아이디를 입력해주세요.");
    } else if (email.text.isEmpty) {
      showErrorAlertDialog(context, "이메일를 입력해주세요.");
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SignUp_Step3(Purpose_Helper.signup_personal, name.text, identify.text, email.text, phone, "null")));
    }
  }
}
