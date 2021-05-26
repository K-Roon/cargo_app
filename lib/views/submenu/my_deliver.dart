import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Mydeliver extends StatefulWidget {
  const Mydeliver({Key key}) : super(key: key);

  @override
  _MydeliverState createState() => _MydeliverState();
}

class _MydeliverState extends State<Mydeliver> {
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
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
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
