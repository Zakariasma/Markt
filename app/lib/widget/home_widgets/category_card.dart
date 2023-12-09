import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/env.dart';

class CategoryCard extends StatefulWidget{
  final Category category;
  final void Function(int)? getCategoryID;

  CategoryCard({required this.category, this.getCategoryID});

  @override
  _CategoryCard createState() => _CategoryCard();
}

class _CategoryCard extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.getCategoryID!(widget.category.id);
      },
      child: Container(
        width: 150.0,
        height: 100.0,
        margin: const EdgeInsets.only(left: 15),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${baseUrl}assets/static/category_img/${widget.category.image}'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  widget.category.category_name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

