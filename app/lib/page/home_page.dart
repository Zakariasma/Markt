import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';
import 'package:markt/domain/category.dart';

import '../data/category_repository.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CategoryRepository repository = CategoryRepository();
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = repository.getAllCategories();
    futureCategories.then((categories) {
      for (var category in categories) {
        print('Category: ${category.category_name}');
      }
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
          CategoryList(),
          SectionTitle('DERNIER ARTICLE'),
          ProductList(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

}
