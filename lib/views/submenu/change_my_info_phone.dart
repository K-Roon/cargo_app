import 'package:cargo_app/helper/constants.dart';
import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeMyPhone extends StatefulWidget {
  final String phoneNumber;

  ChangeMyPhone(this.phoneNumber);

  @override
  _ChangeMyPhoneState createState() => _ChangeMyPhoneState(phoneNumber);
}

TextEditingController phone = new TextEditingController();

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
      appBar: appBarCustom(context, ""),
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
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("현재 휴대폰 번호")),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: -5, horizontal: 3.0),
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
                          controller: phone,
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
          changeIt();
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

  ///실제로 바뀝니다..
  void changeIt() async {
    if (phone.text.isEmpty) {
      showErrorAlertDialog(context, "전화번호를 입력해주세요.");
    } else {
      try {
        DatabaseMethods().changeNewInfo("phonenum", phone.text);
        showErrorAlertDialog(
            context, "전화번호가 성공적으로 변경되었어요. 기기에 따라 로그아웃이 진행될 수 있습니다.");
        Constants.userPhoneNum = phone.text;
        HelperFunctions.saveUserLoggedInSharedPreference(false);
      } catch (e) {
        print("Deletion error $e");
        showErrorAlertDialog(context, "Something went wrong");
      }
    }
  }
}
