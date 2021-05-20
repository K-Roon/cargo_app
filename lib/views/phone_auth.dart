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
      appBar: AppBar(elevation: 0,),
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: Row(
          children: [
            OutlinedButton.icon(
                onPressed: () {
                  print("Personal");
                },
                style: OutlinedButton.styleFrom(alignment: Alignment.center),
                )
          ],
        ),
      ),
    );
  }
}
