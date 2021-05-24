import 'package:cargo_app/views/signup/signup_step1.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final TextEditingController idController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isAvailable = false;

  Home() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,

        /*
        automaticallyImplyLeading: false,
        leading: TextButton(
            onPressed: () {
              print("I LOVE U");
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            ),
            style: TextButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            )),
        */

        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    print("I LOVE U");
                  },
                  child: Icon(
                    Icons.gps_not_fixed,
                    color: Colors.black,
                    size: 25,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ))
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
                Center(
                  child: Text("This is the Widget behind the sliding panel"),
                ),
                SlidingUpPanel(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  panel: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
      drawer: drawer_as_info(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget drawer_as_info() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text('Drawer Header'),
          ),
          Container(
            height: (MediaQuery.of(context).size.height),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              children: [
                ListTile(
                  title: Text('화물차 부르기', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('화물차 추천받기', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('내 운송 조회', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('내 정보 관리', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('공지사항', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('고객센터', style: biggerTextStyle_flexible(Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('로그아웃', style: biggerTextStyle_flexible(Colors.white)),
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
