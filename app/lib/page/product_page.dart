import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';
import 'package:markt/widget/product/picture_list.dart';

import '../widget/product/product_information.dart';
import '../widget/product/seller_information.dart';
import '../widget/universal_widgets/return_navbar.dart';

class ProductPage extends StatefulWidget{

  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("PRODUIT"),
      ),
      body: ListView(
        children: <Widget>[
          PictureList(),
          ProductInformation(),
          SellerInformation(),
        ],
      ),
    );
  }

}
