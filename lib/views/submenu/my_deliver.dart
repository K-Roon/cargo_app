import 'package:cargo_app/views/home.dart';
import 'package:flutter/material.dart';

/// 나의 운송이력 등을 확인해볼 수 있습니다.
class MyDelivery extends StatefulWidget {
  const MyDelivery({Key key}) : super(key: key);

  @override
  _MyDeliveryState createState() => _MyDeliveryState();
}

class _MyDeliveryState extends State<MyDelivery> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Icon(
              Icons.home_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
          title: Text("내 운송 관리"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottom: new TabBar(tabs: <Widget>[
            new Text("운송예약"),
            new Text("완료된 운송"),
            new Text("취소된 운송")
          ]),
        ),
        body: new TabBarView(children: <Widget>[
          new Text(
            " TabBarView placeholder 1",
            style: new TextStyle(
                fontSize: 12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
          ),
          new Text(
            " TabBarView placeholder 2",
            style: new TextStyle(
                fontSize: 12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
          ),
          new Text(
            " TabBarView placeholder 3",
            style: new TextStyle(
                fontSize: 12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
          )
        ]),
      ),
    );
  }
}
