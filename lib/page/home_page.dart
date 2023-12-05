import 'package:flutter/material.dart';
import 'package:markt/widget/home_bar.dart';
import 'package:markt/widget/category_list.dart';

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
      body: CategoryList(),
    );
  }



}
