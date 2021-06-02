import 'package:cargo_app/services/auth.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeMyEmail extends StatefulWidget {
  final String myEmail;

  ChangeMyEmail(this.myEmail);

  @override
  _ChangeMyEmailState createState() => _ChangeMyEmailState(myEmail);
}

// ignore: non_constant_identifier_names
TextEditingController email = new TextEditingController();

class _ChangeMyEmailState extends State<ChangeMyEmail> {
  final phoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  final String myEmail;

  _ChangeMyEmailState(this.myEmail);

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
              "이메일 주소 변경",
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
                          child: Text("현재 이메일 주소")),
                      Text(this.myEmail),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("새 이메일 주소"),
                      Form(
                        key: phoneFormKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: this.myEmail,
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
                          controller: email,
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
              "이메일 주소 변경",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  ///이메일 입력칸이 비어있지 않은지 확인하는 단순한 메서드 입니다.
  void changeIt() {
    if (email.text.isEmpty) {
      showErrorAlertDialog(context, "이메일 주소를 입력해주세요.");
    } else {
      AuthService().changeEmail(myEmail, email.text).then((value) {
        if (value == null) {
          showErrorAlertDialog(context, "정상적으로 변경되었습니다.");
        } else {
          print("다음과 같은 오류가 발생했습니다. ${value.toString()}");
          showErrorAlertDialog(
              context, "다음과 같은 오류가 발생했습니다. ${value.toString()}");
        }
      });
    }
  }
}
