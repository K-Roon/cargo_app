import 'package:cargo_app/helper/purpose_helper.dart';
import 'package:cargo_app/views/signup/signup_policy_biz.dart';
import 'package:cargo_app/views/signup/signup_policy_personal.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignUp_Step1 extends StatefulWidget {
  SignUp_Step1();

  @override
  _SignUp_Step1State createState() => _SignUp_Step1State();
}

// ignore: camel_case_types
class _SignUp_Step1State extends State<SignUp_Step1> {
  bool isLoading = false;
  _SignUp_Step1State();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, ""),
      //resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  print(Purpose_Helper.signup_personal);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpPolicyPersonal()));
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.all(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline_sharp,
                      size: 60,
                    ),
                    Text(
                      "개인",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(width: 30),
              OutlinedButton(
                onPressed: () {
                  print(Purpose_Helper.signup_biz);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpPolicyBiz()));
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.all(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apartment_outlined,
                      size: 60,
                    ),
                    Text(
                      "기업",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
