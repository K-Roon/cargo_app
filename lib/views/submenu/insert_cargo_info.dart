import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Insert_cargo_info extends StatefulWidget {
  const Insert_cargo_info({Key key}) : super(key: key);

  @override
  _Insert_cargo_infoState createState() => _Insert_cargo_infoState();
}

class _Insert_cargo_infoState extends State<Insert_cargo_info> {
  bool isno_EV = false;
  bool isAgain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, "화물 정보 입력"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "출발지",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("출발지 입력",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 20),
                Text(
                  "출발 시간",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 20),
                Text(
                  "도착지 입력",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("출발지 입력",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 20),
                Text(
                  "도착 시간",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 20),
                Text(
                  "화물의 종류 (필수 입력)",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("사진추가로 변경 예정",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 20),
                Text(
                  "크기 및 개수 (필수 입력)",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard(
                    "크기 및 개수 입력(ex. 100*120*100Cm/2박스)",
                  ),
                ),
                Container(height: 20),
                Text(
                  "취급시 주의사항 (선택)",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard(""),
                ),
                Container(height: 20),
                Text(
                  "기타",
                  style: smallTextStyle(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isno_EV = isno_EV ? false : true;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text("엘리베이터 없음"),
                            Checkbox(
                              value: isno_EV,
                              onChanged: (bool newValue) {
                                setState(() {
                                  isno_EV = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAgain = isAgain ? false : true;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text("왕복"),
                            Checkbox(
                              value: isAgain,
                              onChanged: (bool newValue) {
                                setState(() {
                                  isAgain = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 20),
                Text(
                  "결제 수단 등록",
                  style: smallTextStyle(),
                ),
                TextFormField(
                  decoration: TextInputDeco.radius_hard("결제 수단 등록",
                      icon: Icon(
                        Icons.edit,
                        size: 15,
                      )),
                ),
                Container(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print("PRESSED");
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
              "호출하기",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
