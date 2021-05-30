import 'package:cargo_app/helper/helperfunctions.dart';
import 'package:cargo_app/views/home.dart';
import 'package:cargo_app/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
=======
  //await Firebase.initializeApp();
>>>>>>> parent of af29372 (FIX : AUTH 문제 수정)
  runApp(MyApp());
  print("IT'S RUNNING...\n애플리케이션의 작동을 시작합니다.");
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  bool userIsLoggedIn = false;
  @override
  void initState() {
    initializeFlutterFire();
    getLoggedInState();
    super.initState();
  }

  ///로그인 여부를 구합니다. 로그인/아웃의 여부는 Auth.dart 에서 다룹니다.
  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
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
      home: userIsLoggedIn != null ?  userIsLoggedIn ? Home() : SignIn()
          : Container(
        child: Center(
          child: SignIn(),
        ),
      ),
    );
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
