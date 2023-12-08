import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';
import 'package:markt/domain/category.dart';

import 'package:markt/data/category_repository.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CategoryRepository repository = CategoryRepository();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    repository.getAllCategories().then((fetchedCategories) {
      setState(() {
        categories = fetchedCategories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          HomeBar(),
          SectionTitle('CATEGORIES'),
          CategoryList(categoryList: categories),
          SectionTitle('DERNIER ARTICLE'),
          ProductList(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

}
