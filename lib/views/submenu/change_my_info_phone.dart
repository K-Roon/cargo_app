import 'package:cargo_app/views/phone_auth/phone_auth_2.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeMyPhone extends StatefulWidget {
  final String phoneNumber;

  ///test
  ChangeMyPhone(this.phoneNumber);

  @override
  _ChangeMyPhoneState createState() => _ChangeMyPhoneState(phoneNumber);
}

// ignore: non_constant_identifier_names
TextEditingController phone_num = new TextEditingController();

class _ChangeMyPhoneState extends State<ChangeMyPhone> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  final String phoneNumber;

  _ChangeMyPhoneState(this.phoneNumber);

  submit() async {
    if (phoneFormKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, ""),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "휴대폰 번호 변경",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 50,
            ),
            Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FractionColumnWidth(.65),
                },
                children: [
                  TableRow(
                    children: [
                      Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("현재 휴대폰 번호")),
                      Text(this.phoneNumber),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("새 휴대폰 번호"),
                      Form(
                        key: phoneFormKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: this.phoneNumber,
                              hintStyle: TextStyle(color: Colors.black26),
                              focusColor: Colors.blue,
                              contentPadding: EdgeInsets.symmetric(vertical: -5, horizontal: 3.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5),
                              )),
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                          textInputAction: TextInputAction.next,
                          controller: phone_num,
                        ),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          isNotNull();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "휴대폰 번호 변경",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  ///전화번호 입력칸이 비어있지 않은지 확인하는 단순한 메서드 입니다.
  void isNotNull() {
    if (phone_num.text.isEmpty) {
      showErrorAlertDialog(context, "전화번호를 입력해주세요.");
    } else {
      print("I LOVE YOU");
    }
  }
}
