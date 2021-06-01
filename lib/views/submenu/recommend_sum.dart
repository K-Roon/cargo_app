import 'package:cargo_app/views/submenu/insert_cargo_info.dart';
import 'package:cargo_app/views/submenu/recommend.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendSum extends StatefulWidget {
  const RecommendSum(this.killogram, {Key key}) : super(key: key);
  final double killogram;

  @override
  _RecommendSumState createState() => _RecommendSumState(this.killogram);
}

class _RecommendSumState extends State<RecommendSum> {
  final double killogram;

  _RecommendSumState(this.killogram);

  String recommend_cargo(killogram) {
    if (killogram >= 15000) return "25톤 트럭";
    else if (killogram >= 11000) return "15톤 트럭";
    else if (killogram >= 8000) return "11톤 트럭";
    else if (killogram >= 5000) return "8톤 트럭";
    else if (killogram >= 3500) return "5톤 트럭";
    else if (killogram >= 2500) return "3.5톤 트럭";
    else if (killogram >= 1400) return "2.5톤 트럭";
    else if (killogram >= 1000) return "1.4톤 트럭";
    else if (killogram >= 500) return "1톤 트럭";
    else if (killogram >= 0) return "0.5톤 트럭";
    else return "트럭 2대 사용";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, "화물차 추천 받기"),
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
                      recommend_cargo(killogram),
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
                        stops: [
                          0.0,
                          0.1
                        ],
                        colors: [
                          Color(0x00FFFFFF),
                          Colors.white
                        ])),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Insert_cargo_info()));
                          print("다시 추천받기");
                        },
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
                        TableRow(children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Text("차량", textAlign: TextAlign.center)),
                          Text("최대 적재(가로)", textAlign: TextAlign.center),
                          Text("최대 적재(세로)", textAlign: TextAlign.center),
                          Text("최대 적재(높이)", textAlign: TextAlign.center),
                          Text("최대 적재무게(kg)", textAlign: TextAlign.center),
                        ], decoration: BoxDecoration(color: Colors.grey[200])),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("0.5톤 다마스",
                                    textAlign: TextAlign.center)),
                            Text("110", textAlign: TextAlign.center),
                            Text("160", textAlign: TextAlign.center),
                            Text("110", textAlign: TextAlign.center),
                            Text("300", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("0.5톤 라보",
                                    textAlign: TextAlign.center)),
                            Text("130", textAlign: TextAlign.center),
                            Text("210", textAlign: TextAlign.center),
                            Text("120", textAlign: TextAlign.center),
                            Text("500", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("1톤", textAlign: TextAlign.center)),
                            Text("160", textAlign: TextAlign.center),
                            Text("270", textAlign: TextAlign.center),
                            Text("170", textAlign: TextAlign.center),
                            Text("1100", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("1.4톤", textAlign: TextAlign.center)),
                            Text("170", textAlign: TextAlign.center),
                            Text("320", textAlign: TextAlign.center),
                            Text("170", textAlign: TextAlign.center),
                            Text("1500", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("2.5톤", textAlign: TextAlign.center)),
                            Text("180", textAlign: TextAlign.center),
                            Text("430", textAlign: TextAlign.center),
                            Text("200", textAlign: TextAlign.center),
                            Text("2700", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("3.5톤", textAlign: TextAlign.center)),
                            Text("200", textAlign: TextAlign.center),
                            Text("480", textAlign: TextAlign.center),
                            Text("200", textAlign: TextAlign.center),
                            Text("3800", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("5톤", textAlign: TextAlign.center)),
                            Text("230", textAlign: TextAlign.center),
                            Text("620", textAlign: TextAlign.center),
                            Text("230", textAlign: TextAlign.center),
                            Text("5500", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("5톤 플러스",
                                    textAlign: TextAlign.center)),
                            Text("235", textAlign: TextAlign.center),
                            Text("720", textAlign: TextAlign.center),
                            Text("230", textAlign: TextAlign.center),
                            Text("5500", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("5톤 플러스 축 카고",
                                    textAlign: TextAlign.center)),
                            Text("235", textAlign: TextAlign.center),
                            Text("720", textAlign: TextAlign.center),
                            Text("230", textAlign: TextAlign.center),
                            Text("8000", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("5톤 플러스 축 윙/탑",
                                    textAlign: TextAlign.center)),
                            Text("240", textAlign: TextAlign.center),
                            Text("780", textAlign: TextAlign.center),
                            Text("230", textAlign: TextAlign.center),
                            Text("8000", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("8톤", textAlign: TextAlign.center)),
                            Text("240", textAlign: TextAlign.center),
                            Text("940", textAlign: TextAlign.center),
                            Text("230", textAlign: TextAlign.center),
                            Text("8800", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("11톤", textAlign: TextAlign.center)),
                            Text("240", textAlign: TextAlign.center),
                            Text("960", textAlign: TextAlign.center),
                            Text("250", textAlign: TextAlign.center),
                            Text("12100", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("18톤", textAlign: TextAlign.center)),
                            Text("240", textAlign: TextAlign.center),
                            Text("1020", textAlign: TextAlign.center),
                            Text("250", textAlign: TextAlign.center),
                            Text("19100", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Text("25톤", textAlign: TextAlign.center)),
                            Text("240", textAlign: TextAlign.center),
                            Text("1020", textAlign: TextAlign.center),
                            Text("250", textAlign: TextAlign.center),
                            Text("27500", textAlign: TextAlign.center),
                          ],
                        ),
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
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Recommend()));
          print("화물차 부르기");
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
              "화물차 부르기",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String carName,
      String maxWeight, int maxHorizonal, int maxVertical, int maxHeight) {
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
                  "적재함 가로: $maxHorizonal\n적재함 세로: $maxVertical\n적재함 높이: $maxHeight\n",
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
}
