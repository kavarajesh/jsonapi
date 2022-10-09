import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class themesetting extends ChangeNotifier{
ThemeData _currentthem = ThemeData.light();
ThemeData get currenttheme =>_currentthem;

themesetting(){

  if(isdark == true){
    _currentthem = ThemeData.dark();
  }else{
    _currentthem =ThemeData.light();
  }

}

void toggelethem()async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  if(_currentthem==ThemeData.light()){
    _currentthem = ThemeData.dark();
    sp.setBool('isdark', true);
  }else{
    _currentthem = ThemeData.light();
    sp.setBool('isdark', false);
  }
  notifyListeners();
}
}