import 'package:cargo_app/helper/helper_purpose.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  final String purpose;

  ///test
  PhoneAuth(this.purpose);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

TextEditingController phone_num = new TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  submit() async {
    if (phoneFormKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "휴대전화 번호를\n입력해주세요.",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
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
