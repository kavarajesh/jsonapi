
import 'package:flutter/material.dart';
class Mytextfild extends StatelessWidget {
  Mytextfild({Key? key, this.email, this.hint}) : super(key: key);
  TextEditingController? email;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: email,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hint),
      ),
    );
  }
}