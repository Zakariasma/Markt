import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/env.dart';

class CategoryCard extends StatefulWidget{
  final Category category;

  CategoryCard({required this.category});

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
        color: Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: Image.network('${baseUrl}assets/static/category_img/${widget.category.image}').image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
