//region imports

//endregion
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/ui/LoginScreen.dart';
import 'package:flutter_ecommerce/ui/SplashScreen.dart';


import 'dart:async';

import 'package:flutter_ecommerce/utils/SharedPref.dart';


/// This variable is used to get dynamic colors when theme mode is changed

var getData;
bool ios13 = false;
void main() async {
//region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
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
          home: SplashScreen(),
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
