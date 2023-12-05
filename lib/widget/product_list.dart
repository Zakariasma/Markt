import 'package:flutter/material.dart';

class ProductList extends StatefulWidget{

  @override
  _ProductList createState() => _ProductList();

}

class _ProductList extends State<ProductList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000,
      margin: EdgeInsets.only(top: 25),
      color: Colors.deepOrangeAccent,
    );
  }
}