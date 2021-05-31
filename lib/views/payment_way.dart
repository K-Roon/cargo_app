import 'package:flutter/material.dart';

class PaymentWay extends StatefulWidget {
  const PaymentWay({Key key}) : super(key: key);

  @override
  _PaymentWayState createState() => _PaymentWayState();
}

class _PaymentWayState extends State<PaymentWay> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("결제페이지"),);
  }
}
