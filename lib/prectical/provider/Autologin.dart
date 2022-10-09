import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class autoLogin {
 static Future<bool>checkLoogin() async {
    var sp = await SharedPreferences.getInstance();
    var islogin = sp.getString('Islogin');
    if (sp.containsKey('Islogin')==true) {
      return true;
    } else {
      return false;
    }
  }
  Future Logout()async{
   var sp = await SharedPreferences.getInstance();
   sp.clear();
  }
  ThemeData dark = ThemeData(primaryColor: Colors.orange);
 ThemeData light = ThemeData(primaryColor: Colors.red);




}
