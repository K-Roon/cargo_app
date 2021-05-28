import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  const Notice({Key key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {

  @override
  Widget build(BuildContext context) {
    TextEditingController searchBar = new TextEditingController();
    return Scaffold(
      appBar: appBarSub(context, ""),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "공지사항",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 50,
            ),
            Form(
              child: TextFormField(
                decoration: TextInputDeco.search("검색"),
                style: TextStyle(color: Colors.blue, fontSize: 16),
                textInputAction: TextInputAction.search,
                controller: searchBar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
