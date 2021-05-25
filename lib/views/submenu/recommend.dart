import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  final _Fkey = GlobalKey<FormState>();

  ///상자의 세로
  TextEditingController box_vertical = new TextEditingController();

  ///상자의 가로
  TextEditingController box_horizonal = new TextEditingController();

  ///상자의 높이
  TextEditingController box_height = new TextEditingController();

  ///상자의 개당 무게
  TextEditingController box_per_weight = new TextEditingController();

  ///상자의 개수
  TextEditingController box_count = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_sub(context, "화물차 추천 받기"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "화물의 종류를 선택하세요.",
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GroupButton(
                    spacing: 10,
                    isRadio: true,
                    direction: Axis.horizontal,
                    onSelected: (index, isSelected) => print(
                        '$index button is ${isSelected ? 'selected' : 'unselected'}'),
                    buttons: ["박스", "파렛트", "기타"],
                    selectedButtons: [],
                    selectedTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                    unselectedTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    selectedColor: Colors.transparent,
                    unselectedColor: Colors.transparent,
                    selectedBorderColor: Colors.blue,
                    unselectedBorderColor: Colors.black,
                    borderRadius: BorderRadius.circular(5.0),
                    selectedShadow: <BoxShadow>[
                      BoxShadow(color: Colors.transparent)
                    ],
                    unselectedShadow: <BoxShadow>[
                      BoxShadow(color: Colors.transparent)
                    ],
                  )
                ],
              ),
              Text("사이즈를 입력하세요."),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("가로     "),
                Container(
                    width: 200,
                    child: TextFormField(
                      controller: box_horizonal,
                      decoration: TextInputDeco.square(""),
                    )),
                Text("  cm")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("세로     "),
                Container(
                    width: 200,
                    child: TextFormField(
                      controller: box_vertical,
                      decoration: TextInputDeco.square(""),
                    )),
                Text("  cm")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("높이     "),
                Container(
                    width: 200,
                    child: TextFormField(
                      controller: box_height,
                      decoration: TextInputDeco.square(""),
                    )),
                Text("  cm")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("개당     \n무게     "),
                Container(
                    width: 200,
                    child: TextFormField(
                      controller: box_per_weight,
                      decoration: TextInputDeco.square(""),
                    )),
                Text("  kg")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("개수     "),
                Container(
                    width: 200,
                    child: TextFormField(
                      controller: box_count,
                      decoration: TextInputDeco.square(""),
                    )),
                Text("  박스/파렛트/벌")
              ]),
              Text(
                "주의사항",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("•결과값은 규격 파렛트 사이즈에 맞춰 계산된 값이기 때문에" +
                  "규격은 파렛트로 부터 돌출된 부분은 계산되지 않으니, " +
                  "돌출된 부분을 고려하여 사이즈를 입력하여 주시기 바랍니다.."),
              Text("•개별 차량의 옵션이나 제품의 종류에 따라 사이즈가 변경될 수 있으며, " +
                  "결과값은 통계로 퇄영하여 어림잡아 계산한 값이오니 실제와 다를 수 " +
                  "있습니다. 이에 따른 손실은 책임지지 않으니 배차시 운송사 " +
                  "또는 기사님과 마지막으로 상의해주시기 바랍니다."),
              Container(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print("추천받기");
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
              "추천받기",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
