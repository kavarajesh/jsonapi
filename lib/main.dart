import 'package:flutter/material.dart';
import 'package:jsonapi/Apicall/fetchdata.dart';
import 'package:jsonapi/Apicall/jsonplac.dart';
import 'package:jsonapi/prectical/Login.dart';
import 'package:jsonapi/prectical/category.dart';
import 'package:jsonapi/prectical/color.dart';
import 'package:jsonapi/prectical/provider/Autologin.dart';
import 'package:jsonapi/prectical/provider/loginprovider.dart';
import 'package:jsonapi/prectical/provider/newtheme.dart';
import 'package:jsonapi/prectical/provider/themeProvider.dart';
import 'package:jsonapi/themestyle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool? isdark;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
   isdark = sp.getBool('isdark')?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => loginprovider()),
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (_)=>themesetting())
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {


  MyApp({Key? key,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getCurrentAppTheme();
  }
  @override
  void initState() {
    super.initState();
   // getCurrentAppTheme();
    print(
        'getcurrent them ${themeChangeProvider.darkThemePreference.getTheme()}');
  }
  void getCurrentAppTheme() async {
    themeChangeProvider.setdarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<themesetting>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajesh',
          theme: value.currenttheme,//Styles.themeData(value.darkTheme, context),
          home: FutureBuilder(
            future: autoLogin.checkLoogin(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading');
              } else {
                if (snapshot.data == false) {
                  return LoginScreen();
                } else {
                  return CategoryScreen();
                }
              }
            }),
          ),
        );
      },
    );
  }
}
