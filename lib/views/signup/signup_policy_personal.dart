import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/views/phone_auth/phone_auth.dart';
import 'package:cargo_app/widget/margin_bar.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///개인회원 이용약관 안내입니다.
class SignUpPolicyPersonal extends StatefulWidget {
  const SignUpPolicyPersonal({Key key}) : super(key: key);

  @override
  _SignUpPolicyPersonalState createState() => _SignUpPolicyPersonalState();
}

class _SignUpPolicyPersonalState extends State<SignUpPolicyPersonal> {
  bool criticalServiceAgreement = false;
  bool criticalPersonalInformation = false;
  bool criticalPersonalPosition = false;
  bool criticalOlderThen14 = false;
  bool marketingAgreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, ""),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이용약관 동의",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarginBar.greyBold(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("(필수) 화물선생 서비스 이용약관에 대한 동의"),
                    value: criticalServiceAgreement,
                    onChanged: (bool value) {
                      setState(() {
                        criticalServiceAgreement = value;
                      });
                    }),
                MarginBar.marginBarGrey(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("(필수) 개인정보 수집이용 및 제 3자 제공에 대한 동의"),
                    value: criticalPersonalInformation,
                    onChanged: (bool value) {
                      setState(() {
                        criticalPersonalInformation = value;
                      });
                    }),
                MarginBar.marginBarGrey(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("(필수) 위치기반서비스 이용 약관에 대한 동의"),
                    value: criticalPersonalPosition,
                    onChanged: (bool value) {
                      setState(() {
                        criticalPersonalPosition = value;
                      });
                    }),
                MarginBar.marginBarGrey(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("(필수) 만 14세 이상입니다."),
                    value: criticalOlderThen14,
                    onChanged: (bool value) {
                      setState(() {
                        criticalOlderThen14 = value;
                      });
                    }),
                MarginBar.marginBarGrey(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("(선택) 마케팅 정보 수신에 대한 동의"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    value: marketingAgreement,
                    onChanged: (bool value) {
                      setState(() {
                        marketingAgreement = value;
                      });
                    }),
                MarginBar.greyBold(context),
                CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("전체동의"),
                    value: criticalServiceAgreement &&
                        criticalPersonalInformation &&
                        criticalPersonalPosition &&
                        criticalOlderThen14 &&
                        marketingAgreement,
                    onChanged: (bool value) {
                      setState(() {
                        criticalServiceAgreement = value;
                        criticalPersonalInformation = value;
                        criticalPersonalPosition = value;
                        criticalOlderThen14 = value;
                        marketingAgreement = value;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (criticalServiceAgreement &&
              criticalPersonalInformation &&
              criticalPersonalPosition &&
              criticalOlderThen14) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhoneAuth(
                          PurposeHelper.signUpPersonal,
                          marketing: marketingAgreement,
                        )));
          } else {
            showErrorAlertDialog(context, "약관에 동의 해주세요");
          }
        },
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
}
