import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/product_card.dart';
import 'package:markt/domain/productDTO.dart';

class ProductList extends StatefulWidget{

  final List<ProductDTO> productList;

  ProductList({super.key, required this.productList});

  @override
  _ProductList createState() => _ProductList();

}

class _ProductList extends State<ProductList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      child: Wrap(
        children: List.generate(widget.productList.length, (index) => ProductCard(product: widget.productList[index])),
      ),
    );
  }


}