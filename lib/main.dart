import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/views/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("IT'S RUNNING...\n애플리케이션의 작동을 시작합니다.");
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getLoggedInState();
    super.initState();
  }

  ///로그인 여부를 구합니다. 로그인/아웃의 여부는 Auth.dart 에서 다룹니다.
  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cargo App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
          primaryColorBrightness: Brightness.light,
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          bottomAppBarColor: Color(0xFFEFEFEF),
          primaryColorDark: Color(0xffCFCFCF),
          accentColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(brightness: Brightness.light),
        ),
        home: isLoading
            ? Container(
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                )),
              )
            : userIsLoggedIn != null
                ? userIsLoggedIn
                    ? Home()
                    : SignIn()
                : SignIn());
  }
}

///비어 있음
class IamBlink extends StatefulWidget {
  @override
  _IamBlinkState createState() => _IamBlinkState();
}

class _IamBlinkState extends State<IamBlink> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
