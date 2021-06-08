import 'dart:async';

import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/views/findmyid.dart';
import 'package:cargo_app/views/reset_pw.dart';
import 'package:cargo_app/views/signup/signup_step2.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// * 이 화면은 PhoneAuth 를 통해서만 호출할 수 있습니다.
///
/// * 휴대전화 인증을 위하여 인증번호(OneTimePassword)를 입력받는 화면입니다.
///
/// * 이 화면이 표시되려면 인증하려는 목적([purpose])이 반드시 필요합니다.
/// 여기서 결정되는 목적에 따라서 진행되는 화면이 달라지기 때문입니다.
///
/// * 만약 신규 회원가입을 위해 휴대전화 번호를 인증하려는것이 목적이라면,
/// 개인정보를 마케팅에 사용하는 것에 대하여 동의를 하였는지,
/// 하지 않았는지를 반드시 [bool] 값으로 포함시켜 호출하십시오.
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

TextEditingController txtControllerOtpNum = new TextEditingController();

class _PhoneAuth2State extends State<PhoneAuth2> {
  bool isLoading = false;
  final String purpose2;
  final String getPhoneNum;
  final bool marketing;
  final String verificationId;
  bool isWriteable = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int leftTime = 300;
  int limitCount = 0;
  Timer _timer;

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FindMyId(getPhoneNum)));
        } else if (this.purpose2 == PurposeHelper.findMyPW) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResetPassWord(getPhoneNum)));
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
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (leftTime > 0) {
          --leftTime;
        } else {
          _timer.cancel();
          timeOut();
        }
      });
    });
    super.initState();
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
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "인증번호를\n입력해주세요.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                      ),
                      TextField(
                        enabled: isWriteable,
                        keyboardType: TextInputType.number,
                        decoration: TextInputDeco.defaultCenter("예)000000"),
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        controller: txtControllerOtpNum,
                        onEditingComplete: (() => compelete()),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        "남은 시간: ${(leftTime / 60).floor().toString()}분${(leftTime % 60).toString()}초",
                        textAlign: TextAlign.center,
                        style: mediumTextStyle(),
                      ),
                      TextButton(
                          onPressed: () {
                            if (limitCount < 3 && isWriteable) {
                              ++limitCount;
                              leftTime = 300;
                            } else {
                              showErrorAlertDialog(
                                  context, "더 이상의 시간연장은 불가능합니다.");
                            }
                          },
                          child: Text(
                            "시간 연장",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () => compelete(),
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
              "인증완료",
              style: biggerTextStyle(),
            )),
      ),
    );
  }

  void compelete() {
    if (isWriteable) {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: txtControllerOtpNum.text);
      signInWithPhoneAuthCredential(phoneAuthCredential);
    }
  }

  void timeOut() {
    showErrorAlertDialog(
        context, "시간이 초과되어 재인증이 필요합니다.\n(뒤로가기를 누른 후, '인증번호 받기' 버튼을 다시 눌러주세요)");
    isWriteable = false;
    limitCount = 3;
    _timer.cancel();
  }
}
