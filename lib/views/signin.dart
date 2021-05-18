import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

TextEditingController emailTextEditingController = new TextEditingController();
TextEditingController passwordTextEditingController =
    new TextEditingController();

class _SignInState extends State<SignIn> {
  final signinFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  signIn() async {
    if (signinFormKey.currentState.validate()) {}
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
                  Container(height: 20),

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

                  Container(height: 30),

                  ///아이디 및 비밀번호 입력 창(폼)
                  Form(
                    key: signinFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: textFieldInputDecoration("아이디"),
                          style:
                              TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                          textInputAction: TextInputAction.next,
                        ),
                        Container(height: 15),
                        TextFormField(
                          obscureText: true,
                          style:
                              TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                          decoration: textFieldInputDecoration("비밀번호"),
                          textInputAction: TextInputAction.go,
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
                      ))
                ],
              ),
            ),
    );
  }
}
