import 'package:cargo_app/helper/helper_purpose.dart';
import 'package:cargo_app/views/phone_auth/phone_auth_2.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  final String purpose;

  ///test
  PhoneAuth(this.purpose);

  @override
  _PhoneAuthState createState() => _PhoneAuthState(purpose);
}

TextEditingController phone_num = new TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  final String purpose;

  _PhoneAuthState(this.purpose);

  submit() async {
    if (phoneFormKey.currentState.validate()) {}
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
              "휴대전화 번호를\n입력해주세요.",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 50,
            ),
            Form(
              key: phoneFormKey,
              child: TextFormField(
                decoration: textFieldInputDecoration("전화번호"),
                style: TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                textInputAction: TextInputAction.next,
                controller: phone_num,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          isNotNull();
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
              "인증번호 받기",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  ///전화번호 입력칸이 비어있지 않은지 확인하는 단순한 메서드 입니다.
  void isNotNull() {
    if (phone_num.text.isEmpty) {
      showErrorAlertDialog(context, "전화번호를 입력해주세요.");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuth2(this.purpose, phone_num.text)));
    }
  }

}
