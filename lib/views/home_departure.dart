import 'package:cargo_app/views/signup/signup_step1.dart';
import 'package:cargo_app/views/submenu/insert_cargo_info.dart';
import 'package:cargo_app/views/submenu/my_deliver.dart';
import 'package:cargo_app/views/submenu/recommend.dart';
import 'package:cargo_app/widget/margin_bar.dart';
import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final TextEditingController startArea = new TextEditingController();
final TextEditingController endArea = new TextEditingController();

class Home_departure extends StatefulWidget {
  final bool isDeparture;

  Home_departure(this.isDeparture);

  @override
  _Home_departureState createState() => _Home_departureState(this.isDeparture);
}

class _Home_departureState extends State<Home_departure> {
  final _ScaffoldState = GlobalKey<ScaffoldState>();
  final bool isDeparture;
  bool isLoading = false;
  bool isAvailable = false;
  int point = 0;
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  final List<Tab> myTabs = <Tab>[
    Tab(text: '최근 주소'),
    Tab(text: '즐겨찾는 주소'),
  ];

  _Home_departureState(this.isDeparture);

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .70;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _ScaffoldState,
      drawer: homeDrawer(context),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new FloatingActionButton(
          heroTag: "OpenDrawer",
          onPressed: () {
            _ScaffoldState.currentState.openDrawer();
          },
          backgroundColor: Colors.white,
          elevation: 0.0,
          hoverElevation: 0.0,
          highlightElevation: 0.0,
          focusElevation: 0.0,
          disabledElevation: 0.0,
          child: Icon(Icons.menu_rounded, size: 20, color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              new FloatingActionButton(
                heroTag: "getPosition",
                onPressed: () {
                  print("GPS POSITION");
                },
                backgroundColor: Colors.white,
                elevation: 0.0,
                hoverElevation: 0.0,
                highlightElevation: 0.0,
                focusElevation: 0.0,
                disabledElevation: 0.0,
                child: Icon(Icons.gps_not_fixed_rounded,
                    size: 20, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      //resizeToAvoidBottomInset: false,
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Stack(
              children: <Widget>[
                Container(color: Colors.lime),

                ///슬라이드 바 표시
                slidingUp_Page()
              ],
            ),
    );
  }

  Widget slidingUp_Page() {
    return SlidingUpPanel(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      defaultPanelState: PanelState.OPEN,
      minHeight: 25,
      maxHeight: _panelHeightOpen,
      panel: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///회색계열의 Handle
            Container(
              width: 100,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            Container(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Material(
                  elevation: 20,
                  shadowColor: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: isDeparture ? "출발지 주소 검색" : "도착지 주소 검색",
                        prefixIcon: Icon(Icons.search,
                            size: 20, color: Colors.blueAccent),
                        hintStyle: TextStyle(color: Colors.black26),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: myTabs.length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(tabs: myTabs),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pg1() {
    return DefaultTabController(
      length: myTabs.length,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TabBar(tabs: myTabs),
            TabBarView(
                dragStartBehavior: DragStartBehavior.start,
                children: <Widget>[
                  new Center(
                    child: Text("무야호"),
                  ),
                  new Text(
                    " TabBarView placeholder 2",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  )
                ]),
          ]),
    );
  }

  Widget pg2() {
    return Column(
      children: [Text("무~야~호")],
    );
  }

// ignore: non_constant_identifier_names
  Widget drawer_as_info() {
    return Drawer(
      elevation: 0.0,
      semanticLabel: "FLUTTER",
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    onPressed: () {
                      print("PUSHED");
                    },
                    child: Icon(
                      Icons.person,
                      size: 50,
                    )),
                Text("   포인트 "),
                Text(
                  "  $point 원",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text('화물차 부르기',
                      style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Insert_cargo_info()));
                  },
                ),
                ListTile(
                  title: Text('화물차 추천받기',
                      style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Recommend()));
                  },
                ),
                ListTile(
                  title: Text('내 운송 조회',
                      style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mydeliver()));
                  },
                ),
                ListTile(
                  title: Text('내 정보 관리',
                      style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:
                  Text('공지사항', style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:
                  Text('고객센터', style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:
                  Text('로그아웃', style: txtStyle_flexible(Colors.white, 20)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
