

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonapi/ProductDetail.dart';
import 'package:jsonapi/ProductModel.dart';
import 'package:jsonapi/Welcom.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/jsonplac.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({Key? key}) : super(key: key);
  @override
  _FetchdataState createState() => _FetchdataState();
}
class _FetchdataState extends State<Fetchdata> {
  int page = 1;
  Commm comm = Commm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,CupertinoPageRoute
              (builder: (_)=>josnplacholder()));
          },child: Icon(Icons.arrow_forward_ios),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text('ApiCall'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(page <2)
              page = page + 1;
              else
                page =  page -  1;
            });
          }, icon: Icon(Icons.add,size: 30,))
        ],
      ),
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 0),
            child: TextFormField(
              onChanged: (val){
                print(val.toString());
              },
              decoration: InputDecoration(
                filled: true,
            fillColor: Colors.white,
            hintText: 'Search',prefixIcon: Icon(Icons.search,size: 35,color: Colors.green,),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 2),
              child: FutureBuilder<Welcome>(
                  future: comm.fetchdata(page.toString()),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }else
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          var product = snapshot.data!.data![index];
                          return  InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail(
                               email: snapshot.data!.data![index].email,
                              first_name: snapshot.data!.data![index].firstName,
                              img: snapshot.data!.data![index].avatar,
                              last_name: snapshot.data!.data![index].lastName,)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        product.avatar.toString(),
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Text(
                                      product.email.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product.firstName.toString(),
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          product.lastName.toString(),
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
