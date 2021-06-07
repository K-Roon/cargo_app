import 'package:cargo_app/views/phone_auth/phone_auth_2.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  final String purpose;
  final bool marketing;

  ///test
  PhoneAuth(this.purpose, {this.marketing});

  @override
  _PhoneAuthState createState() =>
      _PhoneAuthState(this.purpose, marketing: this.marketing);
}

TextEditingController phoneNum = new TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  final String purpose;
  final bool marketing;

  _PhoneAuthState(this.purpose, {this.marketing});

  FirebaseAuth _auth = FirebaseAuth.instance;

  submit() async {
    if (phoneFormKey.currentState.validate()) {}
  }

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
                  Form(
                    key: phoneFormKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: TextInputDeco.defaultValue("전화번호"),
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                      textInputAction: TextInputAction.next,
                      controller: phoneNum,
                      onEditingComplete: (() => getOTP()),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isLoading
          ? Container()
          : ElevatedButton(
              onPressed: () {
                getOTP();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
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
