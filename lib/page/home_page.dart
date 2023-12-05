import 'package:flutter/material.dart';
import 'package:markt/widget/home_bar.dart';
import 'package:markt/widget/category_list.dart';
import 'package:markt/widget/product_list.dart';
import 'package:markt/widget/section_title.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: HomeBar(),
      ),
      body: ListView(
        children: <Widget>[
          SectionTitle('hello'),
          CategoryList(),
          SectionTitle('hello'),
          ProductList(),
        ],
      ),
    );
  }






}
