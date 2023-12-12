import 'package:flutter/material.dart';
import 'package:markt/domain/product.dart';
import 'package:markt/widget/home_widgets/.export_directory.dart';
import 'package:markt/widget/product/picture_list.dart';
import 'package:markt/widget/product/product_description.dart';
import 'package:markt/widget/product/same_product.dart';

import '../domain/productDTO.dart';
import '../widget/product/product_information.dart';
import '../widget/product/seller_information.dart';
import '../widget/universal_widgets/return_navbar.dart';
import '../widget/product/maps.dart';

class ProductPage extends StatefulWidget{

  final ProductDTO product;

  ProductPage({Key? key, required this.product}) : super(key: key);

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
        child: ReturnNavbar("PRODUIT",""),
      ),
      body: ListView(
        children: [
          PictureList(productShowing: widget.product),
          ProductInformation(productShowing: widget.product),
          SellerInformation(productShowing: widget.product),
          Maps(productShowing: widget.product),
          ProductDescription(productShowing: widget.product),
          SameProduct(productShowing: widget.product),
        ],
      ),
    );
  }

}
