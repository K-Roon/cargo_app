import 'package:cargo_app/services/database.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FindMyId extends StatefulWidget {
  final String phoneNum;

  const FindMyId(this.phoneNum, {Key key}) : super(key: key);

  @override
  _FindMyIdState createState() => _FindMyIdState(this.phoneNum);
}

class _FindMyIdState extends State<FindMyId> {
  final String phoneNum;
  bool isLoading = false;
  String myId;

  _FindMyIdState(this.phoneNum);

  @override
  void initState() {
    getMyId();
    super.initState();
  }

  getMyId() async {
    print("GETTING MY ID..");
    QuerySnapshot querySnapshot =
        await DatabaseMethods().getUserInfoWithPhoneNum(this.phoneNum);
    setState(() {
      myId = querySnapshot.docs[0].get("userId");
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: appBarCustom(context, ""),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "아이디 찾기",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    "아이디를 찾았습니다.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(vertical: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Colors.black38)),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(myId == null ? "LOADING.." : myId),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
