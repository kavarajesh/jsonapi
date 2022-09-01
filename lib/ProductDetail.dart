import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  String? img, email, first_name, last_name;

  ProductDetail(
      {Key? key, this.email, required this.img, this.first_name, this.last_name})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  TextStyle mytextst20 =const TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.bold);
  TextStyle mytextst = const TextStyle(color: Colors.red,fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            widget.img.toString(),
            fit: BoxFit.fill,
            height: 500,
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.first_name.toString(),style: mytextst20,),
              SizedBox(width: 5,),
              Text(widget.last_name.toString(),style: mytextst20,),
            ],
          ),
          Text(widget.email.toString(),style: mytextst,)
        ],
      ),
    );
  }
}
