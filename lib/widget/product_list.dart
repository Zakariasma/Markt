import 'package:flutter/material.dart';
import 'package:markt/widget/product_card.dart';

class ProductList extends StatefulWidget{

  @override
  _ProductList createState() => _ProductList();

}

class _ProductList extends State<ProductList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 25),
      child: Wrap(
        children: List.generate(10, (index) => ProductCard()),
      ),
    );
  }


}