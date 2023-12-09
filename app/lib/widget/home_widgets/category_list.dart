import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/category_card.dart';
import 'package:markt/domain/category.dart';

class CategoryList extends StatefulWidget{

  final List<Category> categoryList;
  final void Function(int)? passAtHomeCategoryId;

  CategoryList({super.key, required this.categoryList, required this.passAtHomeCategoryId});

  @override
  _CategoryList createState() => _CategoryList();

}

class _CategoryList extends State<CategoryList> {

  void passAtHomeCategoryId(int categoryId) {
    widget.passAtHomeCategoryId!(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          Category category = widget.categoryList[index];
          return CategoryCard(category: category, getCategoryID: passAtHomeCategoryId);
        },
      ),
    );
  }
}
