import 'package:flutter/material.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/model/Usermodels.dart';

class GetUserListData extends StatefulWidget {
  const GetUserListData({Key? key}) : super(key: key);

  @override
  _GetUserListDataState createState() => _GetUserListDataState();
}

class _GetUserListDataState extends State<GetUserListData> {
  Commm comm = new Commm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0,
        title: Text('Get Userdata in List',
        style: TextStyle(
          color: Colors.black
        )),
      ),
      backgroundColor: Colors.yellow[50],
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            width: double.infinity,
            color: Colors.red[300],
            child: Text('https://jsonplaceholder.typicode.com/users',style: TextStyle(fontSize: 18),),
          )
,
          Expanded(
            child: FutureBuilder<List<UserModel>>(
                future: comm.getUserList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        CircleAvatar
                                          (
                                          maxRadius: 25,
                                          child: Text(
                                            '${data.id}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        Text(
                                          'Name :  ${data.name}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'UserName :  ${data.username}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Email :  ${data.email}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Company :  ${data.company!.name}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Phone No :  ${data.phone}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'City :  ${data.address!.city}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'City :  ${data.address!.suite} \n${data.address!.street}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(child: Text('no data'));
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
