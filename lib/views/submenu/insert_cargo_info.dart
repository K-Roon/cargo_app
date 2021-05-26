import 'package:cargo_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class Insert_cargo_info extends StatefulWidget {
  const Insert_cargo_info({Key key}) : super(key: key);

  @override
  _Insert_cargo_infoState createState() => _Insert_cargo_infoState();
}

class _Insert_cargo_infoState extends State<Insert_cargo_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_custom(context, "화물 정보 입력"),
      body: Column(
        
      ),
    );
  }
}
