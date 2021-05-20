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
      appBar: AppBar(),
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: Row(
          children: [
          ],
        ),
      ),
    );
  }
}
