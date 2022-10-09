import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginprovider extends ChangeNotifier{

String email = '123';
String password = '123456';
bool isloading = false;
String msg = '';

get mass =>msg;
login(String ema,String psw) async
{
  var sp = await SharedPreferences.getInstance();
  isloading = true;
  if(email==ema&&password==psw){
    print('login success');
    msg='Login Success';
    sp.setString('Islogin', 'yes');
        notifyListeners();
  }else{
    log('Login fail');
    msg='Login fail';
    //sp.setString('Islogin', 'No');
    notifyListeners();
  }
  print("Sahere /// ${sp.getString('Islogin')}");
  isloading =  false;
  notifyListeners();
}
}

