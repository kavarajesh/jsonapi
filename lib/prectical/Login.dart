import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/category.dart';
import 'package:jsonapi/prectical/color.dart';
import 'package:jsonapi/prectical/mtbutton.dart';
import 'package:jsonapi/prectical/myDilog.dart';
import 'package:jsonapi/prectical/mytextfild.dart';
import 'package:jsonapi/prectical/progress_indicator.dart';
import 'package:jsonapi/prectical/provider/loginprovider.dart';
import 'package:jsonapi/prectical/provider/newtheme.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isload = false;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  //loginprovider login = new loginprovider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<loginprovider>(context,listen: false);
    final setting = Provider.of<themesetting>(context,listen: false);
    print('provider');
    return Scaffold(
        backgroundColor: myclor.back,
        appBar: AppBar(
          elevation: 0,
          //backgroundColor: myclor.darkprimary,
          title: Text(''),
          actions: [
            IconButton(onPressed: (){
              setting.toggelethem();
            }, icon: Icon(Icons.bookmark))
          ],
        ),
        body:
        login.isloading == false?
        ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 20),
                child: Text('Welcome User \nLogin',style: TextStyle(fontSize: 30, color: myclor.back),),
              ),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: myclor.darkprimary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_alt_outlined,color: myclor.darkprimary,size:120 ,),
                  SizedBox(
                    height: 20,
                  ),
                  Mytextfild(hint: 'Email',
                  email: email),
                  SizedBox(
                    height: 10,
                  ),
                  Mytextfild(hint: 'Password',email: password),
                  SizedBox(
                    height: 30,
                  ),
                  Mybutton(
                    name: 'Login',
                    ontap: () {
                     login.login(email.text,password.text);
                    // final msg = Provider.of<loginprovider>(context,listen: false).mass.toString();
                     print( '/////${''}');
                        //isload =! isload;
                        //myDilog.showAlertDialog(context);
                        print(isload);
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>CategoryScreen()));
                      print('login');
                    },
                  )
                ],
              ),
            )
          ],
        ):Center(child: myprogressindicater()));
  }
}




