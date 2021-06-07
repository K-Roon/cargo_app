import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/views/findmyid.dart';
import 'package:cargo_app/views/reset_pw.dart';
import 'package:cargo_app/views/signup/signup_step2.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth2 extends StatefulWidget {
  final String purpose2;
  final String getPhoneNum;
  final bool marketing;
  final String verificationId;

  PhoneAuth2(this.purpose2, this.getPhoneNum, this.verificationId,
      {this.marketing});

  @override
  _PhoneAuth2State createState() =>
      _PhoneAuth2State(purpose2, getPhoneNum, verificationId,
          marketing: marketing);
}

TextEditingController otp_num = new TextEditingController();

class _PhoneAuth2State extends State<PhoneAuth2> {
  final otpFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isCorrect = true;
  final String purpose2;
  final String getPhoneNum;
  final bool marketing;
  final String verificationId;
  String otpNum = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  _PhoneAuth2State(this.purpose2, this.getPhoneNum, this.verificationId,
      {this.marketing});

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        isLoading = false;
      });

      if (authCredential?.user != null) {
        if (this.purpose2 == PurposeHelper.signUpPersonal ||
            this.purpose2 == PurposeHelper.signUpBiz) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignUpStep2(getPhoneNum, purpose2, marketing)));
        } else if (this.purpose2 == PurposeHelper.findMyID) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FindMyId(getPhoneNum)));
        } else if (this.purpose2 == PurposeHelper.findMyPW) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResetPassWord(getPhoneNum)));
        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      showErrorAlertDialog(context, e.toString());
    }
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
                    "인증번호를\n입력해주세요.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    height: 50,
                  ),
                  Form(
                    key: otpFormKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: TextInputDeco.defalut_center(
                          "예)000000"),
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.center,
                      controller: otp_num,
                      onEditingComplete: (()=>compelete()),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          compelete();
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
              "인증완료",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  void compelete() {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp_num.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }
}
