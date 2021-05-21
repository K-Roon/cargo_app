import 'package:cargo_app/helper/helper_purpose.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth2 extends StatefulWidget {
  final String purpose;

  ///test
  PhoneAuth2(this.purpose);

  @override
  _PhoneAuth2State createState() => _PhoneAuth2State();
}

TextEditingController otp_num = new TextEditingController();

class _PhoneAuth2State extends State<PhoneAuth2> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

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
              "인증번호를\n입력해주세요.",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(height: 50,),
            Form(
              key: phoneFormKey,
              child: TextFormField(
                decoration: textFieldInputDecoration("전화번호"),
                style: TextStyle(
                    color: Color(0xFF0073FF), fontSize: 16),
                textInputAction: TextInputAction.next,
                controller: otp_num,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          getAuthOTP();
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

  void getAuthOTP() {
    if(otp_num.text.isEmpty) {
      showErrorAlertDialog(context, "OTP 번호를 입력해주세요.");
    } else {
      print("인증번호 전송");
    }
  }
}
