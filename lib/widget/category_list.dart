import 'package:flutter/material.dart';
import 'package:markt/widget/category_card.dart';

class CategoryList extends StatefulWidget{

  @override
  _CategoryList createState() => _CategoryList();

}

class _CategoryList extends State<CategoryList> {


  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard();
            },
          ),
    );
  }
}