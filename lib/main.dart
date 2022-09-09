import 'package:flutter/material.dart';
import 'package:jsonapi/fetchdata.dart';
import 'package:jsonapi/jsonplac.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rajesh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Fetchdata(),
    );
  }
}


