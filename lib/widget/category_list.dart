import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget{

  @override
  _CategoryList createState() => _CategoryList();

}

class _CategoryList extends State<CategoryList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Colors.lightBlue,
          margin: const EdgeInsets.only(top: 25),
          child: const Padding(
            padding: EdgeInsets.only(left: 15),
          child: Text(
              'hello',
            style: TextStyle(
              fontSize: 20
            ),
          ),
          )
        ),
        Container(
          height: 115.0,
          color: Colors.blue,

        ),
      ],
    );
  }
}