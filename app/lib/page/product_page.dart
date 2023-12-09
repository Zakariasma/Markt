import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';

class ProductPage extends StatefulWidget{

  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          HomeBar(),
        ],
      ),
    );
  }

}
