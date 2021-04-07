import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferencesTest {
  final String login = "login";


  Future<String> applogo(String type,String value) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "0") {
      prefs.setString("applogo", value);
      return a;
    } else if (type == "1") {
      String tok = prefs.getString("applogo");
      return tok != null ? tok : "false";
    } else {
      prefs.setString("applogo", value);
      return a;
    }
  }
  Future<String> checkIsLogin(String value) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("login", "true");
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("login");
      return tok != null ? tok : "false";
    } else {
      prefs.setString("login", "false");
      return a;
    }
  }
  Future<String> accesstoken(String value,String token) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("token", token);
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("token");
      return tok != null ? tok : "";
    } else {
      prefs.setString("login", token);
      return a;
    }
  }



  saveRegisteredValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('registeredValue', value);
  }

  Future<bool> getRegisteredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('registeredValue') ?? false;
  }

  saveToggleValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('toggleValue', value);
  }

  Future<bool> getTogglevalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('toggleValue') ?? false;
  }

  /*Future<String> saveuserdata(String type, {Data userdata}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "set") {
      prefs.setString('userdata', json.encode(userdata.toJson()));
      return "Set";
    } else {
      String userentity = prefs.getString('userdata');
      return userentity;
    }
  }*/
}
