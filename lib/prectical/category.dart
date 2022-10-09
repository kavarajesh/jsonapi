
import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/Login.dart';
import 'package:jsonapi/prectical/color.dart';
import 'package:jsonapi/prectical/provider/Autologin.dart';
import 'package:jsonapi/prectical/themlightanddark.dart';
import 'package:jsonapi/prectical/update.dart';
class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  autoLogin logout = new autoLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
       // backgroundColor: myclor.darkprimary,
        actions: [
          IconButton(onPressed: (){
           // logout.Logout();
            Navigator.push(context, MaterialPageRoute(builder: (_)=>themLightAndDark()));

          }, icon: Icon(Icons.logout))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 26,
            itemBuilder: (context, index) {
          return rowitem(
            name: index.toString(),
            ontap: (){
               print(index.toString());
               Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateScreen()));
            },
          );
        }))

    );
  }
}


class rowitem extends StatelessWidget {
  rowitem({Key? key,this.name ,required this.ontap }) : super(key: key);
String? name;
VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Card(
          color: myclor.back,
          child: Container(
            height:100,
            width: double.infinity,
            child: Column(
              children: [
                Text('$name',style: TextStyle(fontSize: 25),)                   ],
            ),
          ),
        ),
      ),
    );
  }
}
