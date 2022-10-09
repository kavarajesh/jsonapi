import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/color.dart';
import 'package:jsonapi/prectical/mtbutton.dart';
import 'package:jsonapi/prectical/mytextfild.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({Key? key}) : super(key: key);
  String e = 'rajesh';
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text = e;
    return Scaffold(
      backgroundColor: myclor.back,
      appBar: AppBar(
        backgroundColor: myclor.darkprimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Mytextfild(
              email: email,
              hint: 'Name',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfild(
              hint: 'Mobile No',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfild(
              hint: 'City',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfild(
              hint: 'Email',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfild(
              hint: 'Password',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfild(
              hint: 'Re_Type Password',
            ),
            SizedBox(
              height: 10,
            ),
            Mybutton(name: 'Update')
          ],
        ),
      ),
    );
  }
}
