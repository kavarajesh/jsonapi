import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jsonapi/model/Arr.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/model/jsonplacmodel.dart';
import 'package:http/http.dart' as http;

class josnplacholder extends StatefulWidget {
  josnplacholder({Key? key}) : super(key: key);

  @override
  State<josnplacholder> createState() => _josnplacholderState();
}

class _josnplacholderState extends State<josnplacholder> {
  Commm commm = new Commm();
  final _debouncer = Debouncer();
  /////
  List<Welcome1> ulist = [];
  List<Welcome1> userLists = [];
  //API call for All Subject List

  String url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Welcome1>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<Welcome1> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Welcome1> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Welcome1>((json) => Welcome1.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }

/////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jsonplac holder'),
        backgroundColor: Colors.orange,
          elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.only(right: 15,left: 15,bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey
                ),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    suffixIcon: InkWell(
                      child: Icon(Icons.search),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Search ',
                  ),
                  onChanged: (string) {
                    _debouncer.run(() {
                      setState(() {
                        userLists = ulist
                            .where(
                              (u) => (u.title!.toLowerCase().contains(
                                    string.toLowerCase(),
                                  )),
                            )
                            .toList();
                      });
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.only(right: 8,left: 8,bottom: 0),
                  child: ListView.builder(
                      itemCount: userLists.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color:Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child:

                                ListTile(
                                  title: Text(
                                    '${userLists[index].title}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ), // overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    'User  ID : ${userLists[index].id}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ), // overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: FloatingActionButton(
                                    backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                    onPressed: (){},
                                    child: Text('${userLists[index].title![0].toUpperCase()}',style: TextStyle(fontSize: 30),),
                                  )
                                )));
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;
  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
