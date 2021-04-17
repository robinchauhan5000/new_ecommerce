import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/SplashScreen.dart';
import 'dart:async';
import 'package:flutter_ecommerce/utils/SharedPref.dart';
import 'package:flutter_ecommerce/ui/MainLists.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
var getData;
bool ios13 = false;
void main() async {
//region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
//endregion
}

const iOSLocalizedLabels = false;

class MyApp extends StatefulWidget
{
  @override
  MyAppState createState()
  {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp>
{
  String _textFromFile = "";
  MyAppState() {
    getlogintoken().then((val) {
      setState(() {
        _textFromFile = val;
      });
    });
  }

  @override
  void initState() {

    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    var window = WidgetsBinding.instance.window;

  }

  @override
  Widget build(BuildContext context)
  {
    if (_textFromFile == "true") {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [Locale('en', '')],
          home: MainListPage(),
      );
    } else
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('en', '')],
        home: SplashScreen(),
      );
    }
  }

  Future<String> getlogintoken() async {
    {
      var login = await SharedPreferencesTest().checkIsLogin("1");
      return login;
    }
  }


}
