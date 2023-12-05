import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget{

  @override
  _CategoryCard createState() => _CategoryCard();

}

class _CategoryCard extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 100.0,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

}