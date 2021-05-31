import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:flutter/material.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  TextEditingController hasNamePersonal = new TextEditingController();
  TextEditingController cardNoPersonal = new TextEditingController();
  TextEditingController validPersonal = new TextEditingController();
  TextEditingController cardPwPersonal = new TextEditingController();
  TextEditingController birthDayPersonal = new TextEditingController();

  TextEditingController hasNameBiz = new TextEditingController();
  TextEditingController cardNoBiz = new TextEditingController();
  TextEditingController validBiz = new TextEditingController();
  TextEditingController cardPwBiz = new TextEditingController();
  TextEditingController bizNumBiz = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("카드등록"),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "개인카드",
              ),
              Tab(
                text: "법인카드",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            personalCard(),
            bizCard(),
          ],
        ),
      ),
    );
  }

  personalCard() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: TextInputDeco.default_value("소유주 이름"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: hasNamePersonal,
            keyboardType: TextInputType.text,
          ), Container(),
          TextFormField(
            obscureText: true,
            decoration: TextInputDeco.default_value("카드번호(****-****-****-****)"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: cardNoPersonal,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: TextInputDeco.default_value("유효기간(MM/YY)"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: validPersonal,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: TextInputDeco.default_value("생년월일(YYMMDD)"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: birthDayPersonal,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            obscureText: true,
            decoration: TextInputDeco.default_value("카드 비밀번호 앞 2자리"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: cardPwPersonal,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  bizCard() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: TextInputDeco.default_value("소유주 이름"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: hasNameBiz,
            keyboardType: TextInputType.text,
          ), Container(),
          TextFormField(
            obscureText: true,
            decoration: TextInputDeco.default_value("카드번호(****-****-****-****)"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: cardNoBiz,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: TextInputDeco.default_value("유효기간(MM/YY)"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: validBiz,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: TextInputDeco.default_value("사업자번호"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: bizNumBiz,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            obscureText: true,
            decoration: TextInputDeco.default_value("카드 비밀번호 앞 2자리"),
            style: TextStyle(color: Colors.blue, fontSize: 16),
            textInputAction: TextInputAction.next,
            controller: cardPwBiz,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
