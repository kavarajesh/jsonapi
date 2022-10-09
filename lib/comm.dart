import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonapi/model/Arr.dart';
import 'package:jsonapi/Apicall/ProductModel.dart';
import 'package:jsonapi/model/Singleobject.dart';
import 'package:jsonapi/model/Usermodels.dart';
import 'package:jsonapi/model/Welcom.dart';
import 'package:jsonapi/model/album.dart';
import 'package:jsonapi/model/jsonplacmodel.dart';

class Commm {
  Future<Welcome> fetchdata(id) async {
    String url = 'https://reqres.in/api/users?page=' + id;
    final res = await http.get(Uri.parse(url));
    var jsonres = jsonDecode(res.body);
    print(res.body);
    if (res.statusCode == 200) {
      return Welcome.fromJson(jsonres);
    } else {
      return Welcome.fromJson(jsonres);
    }
  }

  Future<List<Welcome1>> fetchdatajsonpalc() async {
    //responce in Array from
    /*
   [
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa"
  },
  {
    "userId":  1,
    "id": 3,
    "title": "omnis laborum odio"
  },
  {
    "userId": 1,
    "id": 4,
    "title": "non esse culpa molestiae omnis sed optio"
  },
  {
    "userId": 1,
    "id": 5,
    "title": "eaque aut omnis a"
  }]
    */
    final url = 'https://jsonplaceholder.typicode.com/albums';

    final res = await http.get(Uri.parse(url));
    List jsonres = jsonDecode(res.body);
    print('jsonplacholder respons == ${jsonres}');
    try {
      if (res.statusCode == 200) {
        return jsonres.map((e) => Welcome1.fromJson(e)).toList();
        //jsonResponse.map((data) => Data.fromJson(data)).toList();
      } else {
        return jsonres.map((e) => Welcome1.fromJson(e)).toList();
      }
    } catch (SocketException) {
      throw "on internet";
    }
  }

  Future<List<Album>> getAlbum(page) async {
    String url = 'https://jsonplaceholder.typicode.com/comments';
    // https://jsonplaceholder.typicode.com/comments?postId=2

    String paggination =
        'https://jsonplaceholder.typicode.com/comments?postId=' + '${page}';

    final res = await http.get(Uri.parse(paggination));
    print('Album data == > ${res.body}');
    List decodedata = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return decodedata.map((data) => Album.fromJson(data)).toList();
    } else {
      return decodedata.map((data) => Album.fromJson(data)).toList();
    }
  }

  Future<SingleApiObejectModel> getSingleApiObjectdata(int page) async {
    /*s
    * {

  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et
  * cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

    }
    * */

    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${page}'));
    var decodedata = jsonDecode(res.body);
    print('Single Api data ==> \n${decodedata}');
    if (res.statusCode == 200) {
      return SingleApiObejectModel.fromJson(decodedata);
    } else {
      return SingleApiObejectModel.fromJson(decodedata);
    }
  }

  Future<List<UserModel>> getUserList() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List decodeuserlist = jsonDecode(res.body);
    print('User list data == > ${res.body}');
    if (res.statusCode == 200) {
      return decodeuserlist.map((data) => UserModel.fromJson(data)).toList();
    } else {
      return decodeuserlist.map((data) => UserModel.fromJson(data)).toList();
    }
  }

}
