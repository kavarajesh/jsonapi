import 'package:flutter/material.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/model/Singleobject.dart';
import 'package:jsonapi/model/jsonplacmodel.dart';

class SingleApiobject extends StatefulWidget {
  const SingleApiobject({Key? key}) : super(key: key);

  @override
  State<SingleApiobject> createState() => _SingleApiobjectState();
}

class _SingleApiobjectState extends State<SingleApiobject> {
  Commm comm = Commm();
  int page = 1;
  @override
  void initState() {
    comm.getSingleApiObjectdata(page);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      backgroundColor: Colors.pink,
        title: Text('Single Api Object data'),
      ),
      backgroundColor: Colors.lightBlue[50],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (page >= 1) {
                    page--;
                    print(page);
                  } else {
                    print(page);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('press next ')));
                  }
                });
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            SizedBox(
              width: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  page++;
                });
              },
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      body: FutureBuilder<SingleApiObejectModel>(
          future: comm.getSingleApiObjectdata(page),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text('Loading...',
                      style: TextStyle(fontSize: 25, color: Colors.red)));
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: Card(
                        elevation: 5,
                          shadowColor: Colors.green,
                          surfaceTintColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                        color: Colors.green[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                        'Title \n${snapshot.data!.title}',
                        style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),

                      ),
                          )),
                    ),
                  ),
                  Center(
                      child: Text(
                    'Body',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.pink[50],
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50,right: 10,left: 10,bottom: 10),
                        child: Text(
                          '${snapshot.data!.body}',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else
              return CircularProgressIndicator();
          }),
    );
  }
}
