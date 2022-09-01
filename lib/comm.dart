import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonapi/ProductModel.dart';
import 'package:jsonapi/Welcom.dart';

class Commm {

 Future<Welcome> fetchdata(id) async
 {
   String url = 'https://reqres.in/api/users?page='+id;
    final res = await http.get(Uri.parse(url));
    var jsonres = jsonDecode(res.body);
    print(res.body);
    if (res.statusCode == 200) {
      return Welcome.fromJson(jsonres);
    } else {
      return Welcome.fromJson(jsonres);
    }
  }
}
