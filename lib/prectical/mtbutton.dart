import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/color.dart';
class Mybutton extends StatelessWidget {
  Mybutton({Key? key, this.ontap, required this.name}) : super(key: key);
  VoidCallback? ontap;
  String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: myclor.darkprimary,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            '$name',
            style: TextStyle(fontSize: 20, color: myclor.back),
          )),
    );
  }
}