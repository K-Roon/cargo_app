import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_subs(context, "화물차 추천 받기"),
      body: Container(
        child: Column(
          children: [
            Text("화물의 종류를 선택하세요."),
          ],
        ),
      ),
    );
  }
}
