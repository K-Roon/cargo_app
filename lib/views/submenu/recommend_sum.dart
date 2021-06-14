import 'package:cargo_app/views/submenu/insert_cargo_info.dart';
import 'package:cargo_app/views/submenu/recommend.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 추천 값에 따라서 차량을 추천하는(??)화면입니다.
class RecommendSum extends StatefulWidget {
  const RecommendSum(this.kilogram, {Key key}) : super(key: key);
  final double kilogram;

  @override
  _RecommendSumState createState() => _RecommendSumState(this.kilogram);
}

class _RecommendSumState extends State<RecommendSum> {
  final double kilogram;

  _RecommendSumState(this.kilogram);

  String recommendCargo(kilogram) {
    if (kilogram >= 15000)
      return "25톤 트럭";
    else if (kilogram >= 11000)
      return "15톤 트럭";
    else if (kilogram >= 8000)
      return "11톤 트럭";
    else if (kilogram >= 5000)
      return "8톤 트럭";
    else if (kilogram >= 3500)
      return "5톤 트럭";
    else if (kilogram >= 2500)
      return "3.5톤 트럭";
    else if (kilogram >= 1400)
      return "2.5톤 트럭";
    else if (kilogram >= 1000)
      return "1.4톤 트럭";
    else if (kilogram >= 500)
      return "1톤 트럭";
    else if (kilogram >= 0)
      return "0.5톤 트럭";
    else
      return "트럭 2대 사용";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, "화물차 추천 받기"),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.0,
                0.2,
                0.2,
                1
              ],
                  colors: [
                Colors.blue,
                Colors.blue,
                Colors.white,
                Colors.white
              ])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Text(
                      "회원님께,",
                      style: TextStyle(
                          color: Colors.white, height: 1.2, fontSize: 18),
                    ),
                    Text(
                      recommendCargo(kilogram),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "을 추천드립니다.",
                      style: TextStyle(
                          color: Colors.white, height: 1.2, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 380.0,
                child: PageView(
                  controller: PageController(viewportFraction: 0.6),
                  children: [
                    _buildCarouselItem(context, "다마스", "300kg", 110, 160, 110),
                    _buildCarouselItem(context, "라보", "500kg", 130, 210, 120),
                    _buildCarouselItem(context, "카고", "1.1톤", 160, 270, 170),
                    _buildCarouselItem(context, "탑", "1.1톤", 160, 270, 170),
                    _buildCarouselItem(context, "윙바디", "1.1톤", 160, 270, 170),
                    _buildCarouselItem(context, "탑", "1.5톤", 170, 320, 170),
                    _buildCarouselItem(context, "윙바디", "1.5톤", 170, 320, 170)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.1],
                        colors: [Color(0x00FFFFFF), Colors.white])),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Recommend())),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sync_rounded),
                            Text(" 다시 추천받기"),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          side: BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Text("    제원",
                              style: TextStyle(height: 3, fontSize: 18))
                        ])
                      ],
                    ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder(
                          horizontalInside: BorderSide(
                              width: 1,
                              color: Colors.grey[200],
                              style: BorderStyle.solid)),
                      children: [
                        _tableRow("carName", 0, 0, 0, 0, isTitle: true),
                        _tableRow("0.5톤 다마스", 110, 160, 110, 300),
                        _tableRow("0.5톤 라보", 130, 210, 120, 500),
                        _tableRow("1톤", 160, 270, 170, 1100),
                        _tableRow("1.4톤", 10, 320, 170, 1500),
                        _tableRow("2.5톤", 180, 430, 200, 2700),
                        _tableRow("3.5톤", 200, 480, 200, 3800),
                        _tableRow("5톤", 230, 620, 230, 5500),
                        _tableRow("5톤 플러스", 235, 720, 230, 5500),
                        _tableRow("5톤 플러스 축 카고", 235, 720, 230, 8000),
                        _tableRow("5톤 플러스 축 윙/탑", 240, 780, 230, 8000),
                        _tableRow("8톤", 240, 940, 230, 8800),
                        _tableRow("11톤", 240, 960, 250, 12100),
                        _tableRow("18톤", 240, 1020, 250, 19100),
                        _tableRow("25톤", 240, 1020, 250, 27500)
                      ],
                    ),
                    Container(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => InsertCargoInfo())),
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
              "화물차 부르기",
              style: biggerTextStyle(),
            )),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String carName,
      String maxWeight, int maxHorizontal, int maxVertical, int maxHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(1.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                ),
              ),
              Text(carName,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
              Text("최대 적재 무게: $maxWeight",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              Container(
                height: 15,
              ),
              Text("사이즈(cm)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(
                  "적재함 가로: $maxHorizontal\n적재함 세로: $maxVertical\n적재함 높이: $maxHeight\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      height: 1.7)),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _tableRow(String carName, int maxHorizontal, int maxVertical,
      int maxHeight, int maxWeight,
      {bool isTitle}) {
    isTitle != null ? isTitle = true : isTitle = false;
    if (isTitle) {
      return TableRow(children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text("차량", textAlign: TextAlign.center)),
        Text("최대 적재(가로)", textAlign: TextAlign.center),
        Text("최대 적재(세로)", textAlign: TextAlign.center),
        Text("최대 적재(높이)", textAlign: TextAlign.center),
        Text("최대 적재무게(kg)", textAlign: TextAlign.center),
      ], decoration: BoxDecoration(color: Colors.grey[200]));
    } else {
      return TableRow(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(carName, textAlign: TextAlign.center)),
          Text(maxHorizontal.toString(), textAlign: TextAlign.center),
          Text(maxVertical.toString(), textAlign: TextAlign.center),
          Text(maxHeight.toString(), textAlign: TextAlign.center),
          Text(maxWeight.toString(), textAlign: TextAlign.center),
        ],
      );
    }
  }
}
