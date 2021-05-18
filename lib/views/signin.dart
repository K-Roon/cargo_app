import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  Form(
                    key: signinFormKey,
                    child: Column(
                      children: [
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

                        ///아이디 및 비밀번호 입력 창
                        TextFormField(
                            decoration: textFieldInputDecoration("아이디"),
                            style: TextStyle(
                                color: Color(0xFF0073FF), fontSize: 16)),

                        TextFormField(
                          style:
                              TextStyle(color: Color(0xFF0073FF), fontSize: 16),
                          decoration: textFieldInputDecoration("비밀번호"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
