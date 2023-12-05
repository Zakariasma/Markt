import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget{

  @override
  _CategoryCard createState() => _CategoryCard();

}

class _CategoryCard extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      margin: const EdgeInsets.only(right: 15, left: 15),
      color: Colors.deepOrangeAccent,
    );
  }

}