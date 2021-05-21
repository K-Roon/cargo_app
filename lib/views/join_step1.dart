import 'package:cargo_app/helper/helper_purpose.dart';
import 'package:cargo_app/views/phone_auth.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinStep1 extends StatefulWidget {
  ///test
  JoinStep1();

  @override
  _JoinStep1State createState() => _JoinStep1State();
}

class _JoinStep1State extends State<JoinStep1> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
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
                  print(Helper_Purpose.signup_personal);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PhoneAuth(Helper_Purpose.signup_personal)));
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
                  print(Helper_Purpose.signup_personal);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PhoneAuth(Helper_Purpose.signup_biz)));
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
