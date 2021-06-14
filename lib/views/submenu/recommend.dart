import 'package:cargo_app/views/submenu/recommend_sum.dart';
import 'package:cargo_app/widget/margin_bar.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List<bool> isSelected = List.generate(3, (index) => false);

  ///상자의 세로
  TextEditingController boxVertical = new TextEditingController();

  ///상자의 가로
  TextEditingController boxHorizontal = new TextEditingController();

  ///상자의 높이
  TextEditingController boxHeight = new TextEditingController();

  ///상자의 개당 무게
  TextEditingController boxPerWeight = new TextEditingController();

  ///상자의 개수
  TextEditingController boxCount = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSub(context, "화물차 추천 받기"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "화물의 종류를 선택하세요.",
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButtons(
                          fillColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          borderColor: Colors.black,
                          selectedBorderColor: Colors.blue,
                          selectedColor: Colors.blue,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.crop_square_sharp,
                                    size: 50,
                                  ),
                                  Text("박스")
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.grid_on,
                                    size: 50,
                                  ),
                                  Text("파렛트")
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.grid_view,
                                    size: 50,
                                  ),
                                  Text("기타")
                                ],
                              ),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < isSelected.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected[buttonIndex] =
                                      !isSelected[buttonIndex];
                                } else {
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        ),
                      ],
                    ),
                  ),
                  Text("사이즈를 입력하세요."),
                  MarginBar.bold(context),
                  _row("가로", boxHorizontal, "cm"),
                  MarginBar.marginBar(context),
                  _row("세로", boxVertical, "cm"),
                  MarginBar.marginBar(context),
                  _row("높이", boxHeight, "cm"),
                  MarginBar.marginBar(context),
                  _row("개당\n무게", boxPerWeight, "kg"),
                  MarginBar.marginBar(context),
                  _row("개수", boxCount, "박스/파렛트/벌"),
                  MarginBar.marginBar(context),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "주의사항",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("•결과값은 규격 파렛트 사이즈에 맞춰 계산된 값이기 때문에" +
                      "규격은 파렛트로 부터 돌출된 부분은 계산되지 않으니, " +
                      "돌출된 부분을 고려하여 사이즈를 입력하여 주시기 바랍니다.."),
                  Text("•개별 차량의 옵션이나 제품의 종류에 따라 사이즈가 변경될 수 있으며, " +
                      "결과값은 통계로 촬영하여 어림잡아 계산한 값이오니 실제와 다를 수 " +
                      "있습니다. 이에 따른 손실은 책임지지 않으니 배차시 운송사 " +
                      "또는 기사님과 마지막으로 상의해주시기 바랍니다."),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          double weight =
              boxPerWeight.text.isEmpty ? 0 : double.parse(boxPerWeight.text);
          double boxes =
              boxCount.text.isEmpty ? 1 : double.parse(boxCount.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecommendSum(weight * boxes)));
          print("추천받기");
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "추천받기",
              style: biggerTextStyle(),
            )),
      ),
    );
  }

  Row _row(
      String text, TextEditingController textEditingController, String unit) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text("$text     "),
      Container(
          width: 200,
          child: TextField(
            controller: textEditingController,
            decoration: TextInputDeco.square(""),
          )),
      Text("  $unit")
    ]);
  }
}
