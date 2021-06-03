import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/auth.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/views/signup/signup_step1.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signinFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isAvailable = false;

  signIn() async {
    if (idController.text.isEmpty) {
      showErrorAlertDialog(context, "ID를 입력해주세요");
    } else if (passwordController.text.isEmpty) {
      showErrorAlertDialog(context, "비밀번호를 입력해주세요");
    } else {
      QuerySnapshot userSnapshot =
          await DatabaseMethods().getEmailById(idController.text);
      if (userSnapshot.docs[0].get("userId") != null ||
          userSnapshot.docs[0].get("userId") != "" ||
          userSnapshot.docs[0].get("email") != null ||
          userSnapshot.docs[0].get("email") != "") {
        print("EMAIL:: ${userSnapshot.docs[0].get("email")}");
        await AuthService()
            .signInWithAccount(userSnapshot.docs[0].get("email"),
                passwordController.text)
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
            showErrorAlertDialog(context, "ID나 비밀번호를 찾을 수 없습니다.");
          } else {
            showErrorAlertDialog(context, "알 수 없는 오류: $result");
          }
        });
      } else {
        showErrorAlertDialog(context, "ID를 찾을 수 없습니다");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Form(
                            key: signinFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration:
                                      TextInputDeco.default_value("아이디"),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  textInputAction: TextInputAction.next,
                                  controller: idController,
                                ),
                                Container(height: 15),
                                TextFormField(
                                  obscureText: true,
                                  textInputAction: TextInputAction.go,
                                  controller: passwordController,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  decoration:
                                      TextInputDeco.default_value("비밀번호"),
                                ),
                              ],
                            ),
                          ),

                          Container(height: 10),

                          ///(가로정렬)아이디 및 비밀번호 찾기, 회원가입
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text("아이디 찾기"),
                                onPressed: () {
                                  print("Find My ID");
                                },
                              ),
                              Text(" | ",
                                  style: TextStyle(color: Colors.black26)),
                              TextButton(
                                child: Text("비밀번호 찾기"),
                                onPressed: () {
                                  print("Find My PW");
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
                                              SignUp_Step1()));
                                },
                              ),
                            ],
                          ),

                          Container(height: 10),

                          GestureDetector(
                              onTap: () {
                                print("카카오톡으로 로그인");
                              },
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
                              onTap: () {
                                print("네이버로 로그인");
                              },
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
      floatingActionButton: ElevatedButton(
        onPressed: () {
          signIn();
        },
        style: ElevatedButton.styleFrom(
          primary: isAvailable ? Color(0xff0055ff) : Color(0xff8d9699),
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}