import 'package:flutter/material.dart';
import 'package:jsonapi/Arr.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/jsonplacmodel.dart';

class josnplacholder extends StatelessWidget {
  josnplacholder({Key? key}) : super(key: key);
  Commm commm = new Commm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jsonplac holder'),
      ),
      backgroundColor: Colors.orange,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Welcome1>>(
              future: commm.fetchdatajsonpalc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                              'Tital : ${snapshot.data![index].title}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ), // overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              'User  ID : ${snapshot.data![index].userId}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ), // overflow: TextOverflow.ellipsis,
                            ),
                            trailing: InkWell(
                                onTap: (){
                                  print('Harsh  id ${snapshot.data![index].id}');
                                },
                                child: Icon(Icons.add,size: 30,color: Colors.green,)),
                          )
                        ));
                      });
                } else {
                  return Center(child: Text('no data ${''}'));
                }
              }),
        ),
      ),
    );
  }
}
