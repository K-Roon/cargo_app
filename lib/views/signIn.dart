import 'dart:async';
import 'dart:io';

import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/services/auth.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/views/phone_auth/phone_auth.dart';
import 'package:cargo_app/views/signup/signup_step1.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool isAvailable = false;
  Color loginButtonBackground = Color(0xff8d9699);
  bool passwordObscure = true;

  void timeOut() {
    showErrorAlertDialog(
        context, "ID, 비밀번호를 찾을 수 없거나 인터넷 속도가 너무 느려 이용할 수 없습니다.");
    setState(() {
      isLoading = false;
    });
    Timer(Duration(minutes: 1), timeOut).cancel();
  }

  signIn() async {
    setState(() {
      isLoading = true;
    });
    if (idController.text.isEmpty) {
      showErrorAlertDialog(context, "ID를 입력해주세요");
      isLoading = false;
    } else if (passwordController.text.isEmpty) {
      showErrorAlertDialog(context, "비밀번호를 입력해주세요");
      isLoading = false;
    } else {
      Timer(Duration(minutes: 1), timeOut);
      QuerySnapshot userSnapshot =
          await DatabaseMethods().getEmailById(idController.text);
      if (userSnapshot.docs[0].get("userId") != null ||
          userSnapshot.docs[0].get("userId") != "" ||
          userSnapshot.docs[0].get("email") != null ||
          userSnapshot.docs[0].get("email") != "") {
        print("EMAIL:: ${userSnapshot.docs[0].get("email")}");
        await AuthService()
            .signInWithAccount(
                userSnapshot.docs[0].get("email"), passwordController.text)
            .then((result) async {
          if (result == null) {
            HelperFunctions.saveUserLoggedInSharedPreference(true);
            HelperFunctions.saveUserNameSharedPreference(
                userSnapshot.docs[0].get("name"));
            HelperFunctions.saveUserEmailSharedPreference(
                userSnapshot.docs[0].get("email"));
            HelperFunctions.saveUserIdSharedPreference(idController.text);
            HelperFunctions.saveUserPWSharedPreference(passwordController.text);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          } else if (result.contains("wrong-password")) {
            showErrorAlertDialog(context, "비밀번호가 틀린 것 같습니다.");
            isLoading = false;
            Timer(Duration(minutes: 1), timeOut).cancel();
          } else {
            showErrorAlertDialog(context, "알 수 없는 오류: $result");
            isLoading = false;
            Timer(Duration(minutes: 1), timeOut).cancel();
          }
        });
      } else {
        showErrorAlertDialog(context, "ID나 비밀번호를 찾을 수 없습니다.");
        isLoading = false;
      }
    }
  }

  Future<bool> _onBackPressed() {
    if (Platform.isAndroid) {
      SystemNavigator.pop(animated: true);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (idController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        loginButtonBackground = Colors.blue;
      } else {
        loginButtonBackground = Color(0xff8d9699);
      }
    });
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 0.0,
        ),
        //resizeToAvoidBottomInset: false,
        body: isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(height: 50),

                            ///화물선생 로고
                            Center(
                              child: Column(
                                children: [
                                  Text("스마트한 화물 배차의 시작"),
                                  Text(
                                    "화물선생",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                            ),

                            Container(height: 50),

                            ///아이디 및 비밀번호 입력 창(폼)
                            Column(
                              children: [
                                TextField(
                                  decoration:
                                      TextInputDeco.defaultValue("아이디"),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  textInputAction: TextInputAction.next,
                                  controller: idController,
                                ),
                                Container(height: 15),
                                TextField(
                                  obscureText: passwordObscure,
                                  textInputAction: TextInputAction.go,
                                  controller: passwordController,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  decoration: InputDecoration(
                                      suffixIcon: TextButton(
                                        child: Icon(Icons.remove_red_eye),
                                        onPressed: () => passwordObscure =
                                            !passwordObscure,
                                      ),
                                      hintText: "비밀번호",
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      focusColor: Colors.blue,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 20.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      )),
                                  onEditingComplete: (() => signIn()),
                                ),
                              ],
                            ),

                            Container(height: 10),

                            ///(가로정렬)아이디 및 비밀번호 찾기, 회원가입
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text("아이디 찾기"),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhoneAuth(
                                              PurposeHelper.findMyID))),
                                ),
                                Text(" | ",
                                    style: TextStyle(color: Colors.black26)),
                                TextButton(
                                  child: Text("비밀번호 찾기"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhoneAuth(
                                                PurposeHelper.findMyPW)));
                                  },
                                ),
                                Text(" | ",
                                    style: TextStyle(color: Colors.black26)),
                                TextButton(
                                  child: Text("회원가입 하기"),
                                  onPressed: () {
                                    print("Join");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpStep1()));
                                  },
                                ),
                              ],
                            ),

                            Container(height: 10),

                            GestureDetector(
                                onTap: () =>
                                    showErrorAlertDialog(context, "지원되지 않습니다."),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: Colors.black26)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.chat_bubble),
                                      Container(width: 5),
                                      Text(
                                        "카카오톡으로 로그인",
                                        style: btnTxtStyle(),
                                      )
                                    ],
                                  ),
                                )),

                            Container(height: 20),

                            ///네이버로 로그인
                            GestureDetector(
                                onTap: () =>
                                    showErrorAlertDialog(context, "지원되지 않습니다."),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: Colors.black26)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.chat_bubble),
                                      Container(width: 5),
                                      Text(
                                        "네이버로 로그인",
                                        style: btnTxtStyle(),
                                      )
                                    ],
                                  ),
                                )),
                            Container(height: 50),
                          ],
                        ),
                      ),
                    ]),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isLoading
            ? Container()
            : ElevatedButton(
                onPressed: () {
                  signIn();
                },
                style: ElevatedButton.styleFrom(
                  primary: loginButtonBackground,
                  alignment: Alignment.center,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "로그인",
                      style: biggerTextStyle(),
                    )),
              ),
      ),
    );
  }
}
