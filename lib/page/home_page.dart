import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';

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
