import 'dart:async';
import 'dart:io';

import 'package:cargo_app/helper/constants.dart';
import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/views/home_departure.dart';
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

final TextEditingController startArea = new TextEditingController();
final TextEditingController endArea = new TextEditingController();

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
  final _ScaffoldState = GlobalKey<ScaffoldState>();
  int count = 1;
  bool isLoading = false;
  bool isAvailable = false;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    setHome();
    permissionLocation();
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
      findMyLocation();
    } else if (count == 1){
      showErrorAlertDialog(
          context,
          "이런! 위치권한을 허락해주지 않으면 위치를 찾을 수 없어요!" +
              "\n(※이 앱은 백그라운드에서 위치를 절대로 추적하지 않습니다)");
      count++;
    } else {
      openAppSettings();
    }
  }

  Future<void> findMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    await getLocation().then((value) {
      print("위치찾기..");
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

                  ///슬라이드 바 표시
                  slidingUp_Page()
                ],
              ),
      ),
    );
  }

  Widget slidingUp_Page() {
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
            ///회색계열의 Handle
            Container(
              width: 100,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            slide_main()
          ],
        ),
      ),
    );
  }

  Widget slide_main() {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              print("출발지 주소 검색");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDeparture(true)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "출발지 주소",
                    style: btnTxtStyle(color: Colors.grey),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            )),
        MarginBar.marginBar(context),
        GestureDetector(
            onTap: () {
              print("카카오톡으로 로그인");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDeparture(false)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "도착지 주소",
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
}
