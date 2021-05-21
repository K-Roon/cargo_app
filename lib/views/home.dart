import 'package:cargo_app/views/signup/signup_step1.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isAvailable = false;

  Home() async {

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
        child: Text("I LOVE YOU"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Home();
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
