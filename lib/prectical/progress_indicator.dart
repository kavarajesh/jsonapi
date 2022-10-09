
import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/color.dart';

class myprogressindicater extends StatelessWidget {
  const myprogressindicater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          elevation: 5,
          child: Container(
            padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 20),

            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: myclor.darkprimary,
                    strokeWidth: 4,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Proccess Data',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      ),
                )
              ],
            ),
          ),
        ));
  }
}
