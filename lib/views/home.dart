import 'dart:async';
import 'dart:io';

import 'package:cargo_app/helper/constants.dart';
import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/home_departure.dart';
import 'package:cargo_app/views/submenu/recommend.dart';
import 'package:cargo_app/widget/margin_bar.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';

Future<Position> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  return position;
}

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int count = 1;
  bool isLoading = false;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    setHome();
    permissionLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scaffoldState.currentState.openDrawer();
      todayTips();
      isLoading = false;
    });

    super.initState();
  }

  setHome() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    Constants.myId = await HelperFunctions.getUserIdSharedPreference();
    Constants.passWord = await HelperFunctions.getUserPWSharedPreference();
    await DatabaseMethods()
        .getUserInfoDB(Constants.myId.toString())
        .then((value) {
      QuerySnapshot querySnapshot = value;
      Constants.userEmail = querySnapshot.docs[0].get("email");
      Constants.userPhoneNum = querySnapshot.docs[0].get("phonenum");
      Constants.receiveEmail = querySnapshot.docs[0].get("marketing_Email");
      Constants.receiveSMS = querySnapshot.docs[0].get("marketing_SMS");
    });
  }

  Future permissionLocation() async {
    if (await Permission.locationWhenInUse.request().isGranted) {
      setState(() {
        isLoading = true;
      });
      findMyLocation();
      isLoading = false;
    } else if (count == 1) {
      showErrorAlertDialog(
          context,
          "??????! (???????????????)??????????????? ??????????????? ????????? ????????? ?????? ??? ?????????!\n" +
              "(?????? ?????? ????????????????????? ????????? ????????? ???????????? ????????????)\n" +
              "????????? ???????????????, ????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????????.");
      count++;
    } else {
      openAppSettings();
    }
  }

  Future<void> findMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    await getLocation().then((value) {
      print("????????????..");
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 16,
      )));
    });
  }

  Future<bool> _onBackPressed() {
    if (Platform.isAndroid) {
      SystemNavigator.pop(animated: true);
    }
  }

  static final CameraPosition seoulCityHall = CameraPosition(
    target: LatLng(37.56666726409609, 126.97841469661337),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldState,
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
              _scaffoldState.currentState.openDrawer();
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
                    permissionLocation();
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
                  GoogleMap(
                    padding: EdgeInsets.fromLTRB(10, 200, 10, 200),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    compassEnabled: false,
                    initialCameraPosition: seoulCityHall,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  ///???????????? ??? ??????
                  slidingUpPage()
                ],
              ),
      ),
    );
  }

  Widget slidingUpPage() {
    return SlidingUpPanel(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      defaultPanelState: PanelState.OPEN,
      minHeight: 25,
      maxHeight: 200,
      panel: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///??????????????? Handle
            Container(
              width: 100,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            slideMain()
          ],
        ),
      ),
    );
  }

  Widget slideMain() {
    return Column(
      children: [
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeDeparture(true))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "????????? ??????",
                    style: btnTxtStyle(color: Colors.grey),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            )),
        MarginBar.marginBar(context),
        GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeDeparture(false))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "????????? ??????",
                    style: btnTxtStyle(color: Colors.grey),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            )),
        Container(height: 15),
      ],
    );
  }

  void todayTips() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    if (formatted != await HelperFunctions.getDismissDate()) {
      showDialog(
          context: context,
          useRootNavigator: false,
          builder: (BuildContext context) {
            return MyDialog();
          });
    }
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool _dismissToday = false;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return AlertDialog(
      elevation: 0.0,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Text(
            "??????",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          )),
      contentPadding: EdgeInsets.all(15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "??????????????? ????????????\n?????? ?????????????",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _dismissToday = !_dismissToday;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                    value: _dismissToday,
                    onChanged: (bool value) {
                      setState(() {
                        _dismissToday = value;
                      });
                    }),
                Text("?????? ?????? ??? ??????")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    if (_dismissToday)
                      HelperFunctions.saveDismissDate(formatted);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Recommend()));
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                  child: Text(
                    "?????? ??????",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_dismissToday)
                      HelperFunctions.saveDismissDate(formatted);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                  child: Text(
                    "?????? ??????",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
