import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class InsertCargoInfo extends StatefulWidget {
  const InsertCargoInfo({Key key}) : super(key: key);

  @override
  _InsertCargoInfoState createState() => _InsertCargoInfoState();
}

class _InsertCargoInfoState extends State<InsertCargoInfo> {
  bool isNoEv = false;
  bool isAgain = false;
  String drDnDepartureWhen = '지금 바로';
  String drDnArrivalWhen = '바로 도착';
  String drDnDepartureWay = '수작업';
  String drDnArrivalWay = '수작업';
  String drDnCarSize = '-';
  String drDnCarKinds = '상관 없음';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("화물정보입력"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "출발지",
                style: smallTextStyle(),
              ),
              TextField(
                decoration: TextInputDeco.radiusHard("출발지 입력",
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
              DropdownButton<String>(
                value: drDnDepartureWhen,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    drDnDepartureWhen = newValue;
                  });
                },
                items: <String>['지금 바로', '예약 하기']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Container(height: 20),
              Text(
                "도착지 입력",
                style: smallTextStyle(),
              ),
              TextField(
                decoration: TextInputDeco.radiusHard("도착지 입력",
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
              DropdownButton<String>(
                value: drDnArrivalWhen,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    drDnArrivalWhen = newValue;
                  });
                },
                items: <String>['바로 도착', '예약 하기']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Container(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///출발 방법
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "출발방법",
                        style: smallTextStyle(),
                      ),
                      DropdownButton<String>(
                        value: drDnDepartureWay,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            drDnDepartureWay = newValue;
                          });
                        },
                        items: <String>['수작업', '지게차', '호이스트', '크레인']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  ///도착 방법
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "도착방법",
                        style: smallTextStyle(),
                      ),
                      DropdownButton<String>(
                        value: drDnArrivalWay,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            drDnArrivalWay = newValue;
                          });
                        },
                        items: <String>['수작업', '지게차', '호이스트', '크레인']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///차량 크기
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "차량크기",
                        style: smallTextStyle(),
                      ),
                      DropdownButton<String>(
                        value: drDnCarSize,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            drDnCarSize = newValue;
                          });
                        },
                        items: <String>[
                          '-',
                          '0.5톤',
                          '1톤',
                          '1.4톤',
                          '2.5톤',
                          '3.5톤',
                          '5톤',
                          '11톤',
                          '18톤',
                          '25톤',
                          '5톤 플러스',
                          '5톤 플축',
                          '8톤',
                          '화물차 추천받기',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  ///차량 종류
                  Column(
                    children: [
                      Text(
                        "차량 종류",
                        style: smallTextStyle(),
                      ),
                      DropdownButton<String>(
                        value: drDnCarKinds,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            drDnCarKinds = newValue;
                          });
                        },
                        items: <String>[
                          '상관 없음',
                          '카고',
                          '윙바디',
                          '호루',
                          '탑',
                          '리프트',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              Container(height: 20),
              Text(
                "화물의 종류 (필수 입력)",
                style: smallTextStyle(),
              ),
              TextField(
                decoration: TextInputDeco.radiusHard("",
                    icon: Icon(
                      Icons.edit,
                      size: 15,
                    )),
              ),
              Container(height: 10),
              GestureDetector(
                onTap: () => print("사진을 찾습니다"),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black26)),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "사진 추가",
                        style: btnTxtStyle(),
                      ),
                      Container(width: 20),
                      Icon(Icons.camera_alt, color: Colors.grey, size: 40),
                      Container(width: 20),
                      Icon(Icons.camera_alt, color: Colors.grey, size: 40),
                      Container(width: 20),
                      Icon(Icons.camera_alt, color: Colors.grey, size: 40),
                    ],
                  ),
                ),
              ),
              Container(height: 20),
              Text(
                "크기 및 개수 (필수 입력)",
                style: smallTextStyle(),
              ),
              TextField(
                decoration: TextInputDeco.radiusHard(
                  "크기 및 개수 입력(ex. 100*120*100Cm/2박스)",
                ),
              ),
              Container(height: 20),
              Text(
                "취급시 주의사항 (선택)",
                style: smallTextStyle(),
              ),
              TextField(
                decoration: TextInputDeco.radiusHard(""),
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
                        isNoEv = isNoEv ? false : true;
                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text("엘리베이터 없음"),
                          Checkbox(
                            value: isNoEv,
                            onChanged: (bool newValue) {
                              setState(() {
                                isNoEv = newValue;
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
              paymentTool(context),
              Container(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () => print("PRESSED"),
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
              "호출하기",
              style: biggerTextStyle(),
            )),
      ),
    );
  }
}
