import 'package:cargo_app/views/phone_auth/phone_auth_2.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// * 휴대전화 인증을 위하여 전화번호를 입력받는 화면입니다.
///
/// * 이 화면이 표시되려면 인증하려는 목적([purpose])이 반드시 필요합니다.
///
/// * 만약 신규 회원가입을 위해 휴대전화 번호를 인증하려는것이 목적이라면,
/// 개인정보를 마케팅에 사용하는 것에 대하여 동의를 하였는지,
/// 하지 않았는지를 반드시 [bool] 값으로 포함시켜 호출하십시오.
class PhoneAuth extends StatefulWidget {
  final String purpose;
  final bool marketing;

  PhoneAuth(this.purpose, {this.marketing});

  @override
  _PhoneAuthState createState() =>
      _PhoneAuthState(this.purpose, marketing: this.marketing);
}

TextEditingController phoneNum = new TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  bool isLoading = false;

  final String purpose;
  final bool marketing;

  _PhoneAuthState(this.purpose, {this.marketing});

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, ""),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
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
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: TextInputDeco.defaultValue("전화번호"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.next,
                    controller: phoneNum,
                    onEditingComplete: (() => getOTP()),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isLoading
          ? Container()
          : ElevatedButton(
              onPressed: () => getOTP(),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                alignment: Alignment.center,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
              ),
              child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    "인증번호 받기",
                    style: biggerTextStyle(),
                  )),
            ),
    );
  }

  ///전화번호 입력칸에 대한 유효성 검사 및 인증번호 전송 요청 등을 수행합니다.
  getOTP() async {
    setState(() {
      isLoading = true;
    });
    if (phoneNum.text.isEmpty) {
      showErrorAlertDialog(context, "전화번호를 입력해주세요.");
      isLoading = false;
    } else {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+82 ${phoneNum.text.replaceFirst("0", "", 0)}",
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            isLoading = false;
          });
          //signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async {
          setState(() {
            isLoading = false;
          });
          showErrorAlertDialog(context, verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhoneAuth2(
                        this.purpose,
                        phoneNum.text,
                        verificationId,
                        marketing: this.marketing,
                      )));
          setState(() {
            isLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          setState(() {
            isLoading = false;
          });
        },
      );
    }
  }
}
