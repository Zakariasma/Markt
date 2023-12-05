import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';

class CreateProduct extends StatefulWidget{

  @override
  _CreateProduct createState() => _CreateProduct();
}

class _CreateProduct extends State<CreateProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          HomeBar(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

}