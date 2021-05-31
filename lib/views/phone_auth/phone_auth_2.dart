import 'package:cargo_app/views/signup/signup_step2.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth2 extends StatefulWidget {
  final String purpose2;
  final String getPhoneNum;

  ///test
  PhoneAuth2(this.purpose2, this.getPhoneNum);

  @override
  _PhoneAuth2State createState() => _PhoneAuth2State(purpose2, getPhoneNum);
}

TextEditingController otp_num = new TextEditingController();

class _PhoneAuth2State extends State<PhoneAuth2> {
  final otpFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isCorrect = true;
  final String purpose2;
  final String getPhoneNum;
  String otpNum = "";

  _PhoneAuth2State(this.purpose2, this.getPhoneNum);

  ///서버에서 인증번호를 보내게 요청하는 메서드 입니다.
  ///
  ///반환값은 String Type의 변수 1개 뿐입니다.
  ///
  ///이 반환값은 서버에서 보낸 인증번호와 동일한지 확인하기 위해 필요합니다.
  Future<void> getOTP(String phoneNum) async {
    print("서버에서 인증번호를 보내게 요청함");
    print('+82 ${phoneNum.replaceFirst("0", "", 0)}');
    FirebaseAuth auth = FirebaseAuth.instance;
    /*
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+82 ${phoneNum.replaceFirst("0", "", 0)}',


      verificationCompleted: (PhoneAuthCredential credential) async {
        //await auth.signInWithCredential(credential);
        await print("LOG: VerificationCompleted");
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) async {
        String smsCode = otp_num.text;

        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        await print("LOG: CODESENT: ${smsCode}");
        //await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
*/

    ///보내어진 인증번호를 받아와서 맞는지 확인해야합니다.
    ///
    ///예를 들어, 보내어진 인증번호가 0000인 경우 반환값을 0000으로 해야합니다.
    if (otp_num.text == "0000") {
      compelete();
    } else {
      showErrorAlertDialog(context, "OTP 번호와 일치하지 않습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    getOTP(getPhoneNum);
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
            Container(
              height: 50,
            ),
            Form(
              key: otpFormKey,
              child: TextFormField(
                decoration: TextInputDeco.default_value("문자인증 API 적용 전 인증번호는 0000 입니다."),
                style: TextStyle(color: Colors.blue, fontSize: 16),
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
          isCorrectOTP();
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff0055dd),
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

  void isCorrectOTP() {
    /*
    if (otp_num.text.isEmpty) {
      showErrorAlertDialog(context, "OTP 번호를 입력해주세요.");
    } else if (otp_num.text == otpNum) {
      print("인증확인");
      if (purpose2 == Purpose_Helper.signup_personal) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUp_Step2(getPhoneNum)));
      } else if (purpose2 == Purpose_Helper.signup_biz) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUp_Step2_Biz(getPhoneNum)));
      } else {
        showErrorAlertDialog(
            context, "죄송합니다만, 어디선가 접근방식이 잘못되었습니다. 앱 종료 후 다시 시도해주세요.");
      }
    } else {
      showErrorAlertDialog(context, "OTP 번호와 일치하지 않습니다.");
    }

    */
  }

  void compelete() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignUp_Step2(getPhoneNum, purpose2)));
  }
}
