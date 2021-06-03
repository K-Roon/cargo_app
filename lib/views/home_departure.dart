import 'dart:async';

import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
class HomeDeparture extends StatefulWidget {
  final bool isDeparture;

  HomeDeparture(this.isDeparture);

  @override
  _HomeDepartureState createState() => _HomeDepartureState(this.isDeparture);
}

class _HomeDepartureState extends State<HomeDeparture> {
  final _ScaffoldState = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  int count = 1;
  final bool isDeparture;
  bool isLoading = false;
  bool isAvailable = false;
  int point = 0;
  double _panelHeightOpen = 0;

  final List<Tab> myTabs = <Tab>[
    Tab(text: '최근 주소'),
    Tab(text: '즐겨찾는 주소'),
  ];

  _HomeDepartureState(this.isDeparture);

  @override
  void initState() {
    permissionLocation();
    super.initState();
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
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(value.latitude, value.longitude), zoom: 16,)));
    });
  }

  static final CameraPosition seoulCityHall = CameraPosition(
    target: LatLng(37.56666726409609, 126.97841469661337),
    zoom: 18,
  );

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
                              BorderSide(color: Colors.black26, width: 0.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 0.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 0.0),
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
}
