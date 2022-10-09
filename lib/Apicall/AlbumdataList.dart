import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonapi/comm.dart';
import 'package:jsonapi/model/album.dart';

class AlbumdataList extends StatefulWidget {
  AlbumdataList({Key? key}) : super(key: key);

  @override
  State<AlbumdataList> createState() => _AlbumdataListState();
}

class _AlbumdataListState extends State<AlbumdataList> {
  Commm comm = new Commm();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)
          )
        ),
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text('Albumdata List'),
      ),
      bottomNavigationBar: Container(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    page--;
                    print(page);
                  });
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Page No : ${page}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    page++;
                    print(page);
                  });
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.white))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Album>>(
                  future: comm.getAlbum(page),
                  builder: (context, snapsot) {
                    if (snapsot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapsot.hasData) {
                        return ListView.builder(
                            itemCount: snapsot.data!.length,
                            itemBuilder: (context, index) {
                              var data = snapsot.data![index];
                              return Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomRight:
                                            Radius.elliptical(30, 20))),
                                child: Column(
                                  children: [
                                    Container(
                                      child: ListTile(
                                        title: Text(
                                          '${data.name!.toUpperCase()}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          'Email : ${data.email}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data.body.toString(),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Text(
                            'NO  DATA',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
