import 'package:cargo_app/widget/textInputDeco.dart';
import 'package:cargo_app/widget/widgets.dart';
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

  String personalCardName;
  String personalCardNo;
  String personalCardValid;
  String personalCardPw;
  String personalCardBirthday;

  String bizCardName;
  String bizCardNo;
  String bizCardValid;
  String bizCardPw;
  String bizCardBizNum;

  @override
  Widget build(BuildContext context) {
    hasNamePersonal.text = personalCardName;
    cardNoPersonal.text = personalCardNo;
    validPersonal.text = personalCardValid;
    cardPwPersonal.text = personalCardPw;
    birthDayPersonal.text = personalCardBirthday;

    hasNameBiz.text = bizCardName;
    cardNoBiz.text = bizCardNo;
    validBiz.text = bizCardValid;
    cardPwBiz.text = bizCardPw;
    bizNumBiz.text = bizCardBizNum;

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
            onPressed: () => Navigator.pop(context),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ElevatedButton(
          onPressed: () => changeMyCard(),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            alignment: Alignment.center,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)),
          ),
          child: Container(
              height: 80,
              alignment: Alignment.center,
              child: Text(
                "카드변경",
                style: biggerTextStyle(),
              )),
        ),
      ),
    );
  }

  personalCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Form(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: TextInputDeco.payment("소유주 이름"),
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        textInputAction: TextInputAction.next,
                        controller: hasNamePersonal,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ],
            ),
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                obscureText: true,
                decoration: TextInputDeco.payment("카드번호(****-****-****-****)"),
                style: TextStyle(color: Colors.blue, fontSize: 16),
                textInputAction: TextInputAction.next,
                controller: cardNoPersonal,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: TextInputDeco.payment("유효기간(MM/YY)"),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            textInputAction: TextInputAction.next,
                            controller: validPersonal,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: TextInputDeco.payment("생년월일(YYMMDD)"),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            textInputAction: TextInputAction.next,
                            controller: birthDayPersonal,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: TextInputDeco.payment("카드 비밀번호 앞 2자리"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.next,
                    controller: cardPwPersonal,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bizCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Form(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: TextInputDeco.payment("소유주 이름"),
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        textInputAction: TextInputAction.next,
                        controller: hasNameBiz,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ],
            ),
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                obscureText: true,
                decoration: TextInputDeco.payment("카드번호(****-****-****-****)"),
                style: TextStyle(color: Colors.blue, fontSize: 16),
                textInputAction: TextInputAction.next,
                controller: cardNoBiz,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration:
                                TextInputDeco.payment("유효기간(MM/YY)"),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            textInputAction: TextInputAction.next,
                            controller: validBiz,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: TextInputDeco.payment("사업자번호"),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            textInputAction: TextInputAction.next,
                            controller: bizNumBiz,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: TextInputDeco.payment("카드 비밀번호 앞 2자리"),
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    textInputAction: TextInputAction.next,
                    controller: cardPwBiz,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeMyCard() {
    print("카드변경");
  }
}
