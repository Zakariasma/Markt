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
        color: Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: Image.network('http://192.168.1.43:3000/assets/static/category_img/image-1701899061222.png').image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}