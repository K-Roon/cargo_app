import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/auth.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignUpStep3 extends StatefulWidget {
  final String purpose;
  final String name;
  final String id;
  final String email;
  final String phoneNumber;
  final bool marketing;

  SignUpStep3(this.purpose, this.name, this.id, this.email, this.phoneNumber,
      this.marketing);

  @override
  _SignUpStep3State createState() => _SignUpStep3State(this.purpose, this.name,
      this.id, this.email, this.phoneNumber, this.marketing);
}

class _SignUpStep3State extends State<SignUpStep3> {
  final String purpose;
  final String name;
  final String id;
  final String email;
  final String phoneNumber;
  final bool marketing;

  TextEditingController pw = new TextEditingController();
  TextEditingController pwConfirm = new TextEditingController();

  bool isLoading = false;
  bool isAvailable = false;

  _SignUpStep3State(this.purpose, this.name, this.id, this.email,
      this.phoneNumber, this.marketing);

  HelperFunctions helperFunctions = new HelperFunctions();
  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

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
                    "?????? ?????? ??????\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "???????????? ??????",
                        style: mediumTextStyle(),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: TextInputDeco.defaultValue("????????????"),
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        textInputAction: TextInputAction.next,
                        controller: pw,
                        keyboardType: TextInputType.text,
                      ),
                      Container(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: TextInputDeco.defaultValue("???????????? ??????"),
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        textInputAction: TextInputAction.next,
                        controller: pwConfirm,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () => confirm(),
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
              "??????",
              style: biggerTextStyle(),
            )),
      ),
    );
  }

  void confirm() {
    if (pw.text.isEmpty) {
      showErrorAlertDialog(context, "??????????????? ??????????????????.");
    } else if (pw.text != pwConfirm.text) {
      showErrorAlertDialog(context, "???????????? ???????????? ???????????? ????????????.");
    } else if (pw.text.length < 6) {
      showErrorAlertDialog(context, "6?????? ????????? ??????????????? ???????????????.");
    } else {
      signupMember();
    }
  }

  /// ????????? ?????????????????? ??????.
  signupMember() async {
    setState(() {
      isLoading = true;
    });
    print(this.email);
    await authService
        .signUpWithEmailAndPassword(this.email, pw.text)
        .then((val) {
      if (val != null) {
        Map<String, dynamic> userDataMap = {
          "email": this.email,
          "name": this.name,
          "userId": this.id,
          "purpose": this.purpose,
          "phonenum": this.phoneNumber,
          "marketing_SMS": this.marketing,
          "marketing_Email": this.marketing,
          "point": 0,
        };

        databaseMethods.uploadUserInfo(this.id, userDataMap);

        HelperFunctions.saveUserLoggedInSharedPreference(true);
        HelperFunctions.saveUserNameSharedPreference(this.name);
        HelperFunctions.saveUserEmailSharedPreference(this.email);
        HelperFunctions.saveUserIdSharedPreference(this.id);
        HelperFunctions.saveUserPWSharedPreference(pw.text);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 0.0,
                titlePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      "??????",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                contentPadding: EdgeInsets.all(10),
                content: Text(
                  "??????????????? ???????????????\n?????????????????????.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                actionsPadding: EdgeInsets.all(10),
                actions: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home())),
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          "??????",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                  )
                ],
              );
            });
      }
    });
    isLoading = false;
  }
}
