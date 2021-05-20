import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

TextEditingController idTextEditingController = new TextEditingController();
TextEditingController passwordTextEditingController =
    new TextEditingController();

class _SignInState extends State<SignIn> {
  final signinFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isAvailable = false;

  signIn() async {
    if (signinFormKey.currentState.validate()) {}
  }

  void showErrorAlertDialog(BuildContext context, String errorText) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0.0,
            titlePadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Container(
                decoration: BoxDecoration(
                    color: Color(0xff0055ff),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "안내",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
            contentPadding: EdgeInsets.only(top: 10),
            content: Text(
              errorText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            actionsPadding: EdgeInsets.all(10),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff0055ff),
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      "확인",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              )
            ],
          );
        });
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
          : Container(
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
                              color: Color(0xFF0073FF)),
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
                          decoration: textFieldInputDecoration("아이디"),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "아이디를 입력해주세요.";
                            } else {
                              return null;
                            }
                          },
                          style:
                              TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                          textInputAction: TextInputAction.next,
                          controller: idTextEditingController,
                        ),
                        Container(height: 15),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "비밀번호를 입력해주세요.";
                            } else {
                              return null;
                            }
                          },
                          style:
                              TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                          decoration: textFieldInputDecoration("비밀번호"),
                          textInputAction: TextInputAction.go,
                          controller: passwordTextEditingController,
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
                      Text(" | ", style: TextStyle(color: Colors.black26)),
                      TextButton(
                        child: Text("비밀번호 찾기"),
                        onPressed: () {
                          print("Find My PW");
                        },
                      ),
                      Text(" | ", style: TextStyle(color: Colors.black26)),
                      TextButton(
                        child: Text("회원가입 하기"),
                        onPressed: () {
                          print("Join");
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
                            border:
                                Border.all(width: 1, color: Colors.black26)),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.chat_bubble),
                            Container(width: 5),
                            Text(
                              "카카오톡으로 로그인",
                              style: buttonTextStyle(),
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
                            border:
                                Border.all(width: 1, color: Colors.black26)),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.chat_bubble),
                            Container(width: 5),
                            Text(
                              "네이버로 로그인",
                              style: buttonTextStyle(),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (isAvailable) {
            print("로그인 버튼 누름");
          } else {
            showErrorAlertDialog(context, "아이디나 비밀번호를 써주세요.");
          }
        },
        child: Container(
            height: 80,
            color: isAvailable ? Color(0xff0055ff) : Color(0xff8d9699),
            alignment: Alignment.center,
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
