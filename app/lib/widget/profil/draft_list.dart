import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/product_card.dart';
import 'package:markt/domain/productDTO.dart';

import 'draft_card.dart';

class DraftList extends StatefulWidget{

  final List<ProductDTO> productList;

  DraftList({super.key, required this.productList});

  @override
  _ProductList createState() => _ProductList();

}

class _ProductList extends State<DraftList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      child: Wrap(
        children: List.generate(widget.productList.length, (index) => DraftCard(product: widget.productList[index])),
      ),
    );
  }


}