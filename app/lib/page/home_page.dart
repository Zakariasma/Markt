import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';
import 'package:markt/domain/category.dart';

import 'package:markt/data/product_repository.dart';
import 'package:markt/domain/productDTO.dart';

import 'package:markt/data/category_repository.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CategoryRepository categoryRepository = CategoryRepository();
  final ProductRepository productRepository = ProductRepository();
  List<Category> categories = [];
  List<ProductDTO> products = [];

  @override
  void initState() {
    super.initState();
    categoryRepository.getAllCategories().then((fetchedCategories) {
      setState(() {
        categories = fetchedCategories;
      });
    });
    productRepository.getProducts().then((fetchedProducts) {
      setState(() {
        products = fetchedProducts;
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
          ProductList(productList: products),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

}
