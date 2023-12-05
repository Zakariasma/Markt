import 'package:flutter/material.dart';
import 'package:markt/widget/home_bar.dart';
import 'package:markt/widget/category_list.dart';
import 'package:markt/widget/product_list.dart';
import 'package:markt/widget/section_title.dart';
import 'package:markt/widget/bottom_navbar.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: HomeBar(),
      ),
      body: ListView(
        children: <Widget>[
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
