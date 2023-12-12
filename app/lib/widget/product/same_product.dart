import 'package:flutter/material.dart';

import '../../data/product_repository.dart';
import '../../domain/productDTO.dart';
import '../home_widgets/product_card.dart';

class SameProduct extends StatefulWidget {

  final ProductDTO productShowing;

  const SameProduct({super.key, required this.productShowing});

  @override
  State<SameProduct> createState() => _SameProductState();
}

class _SameProductState extends State<SameProduct> {

  final ProductRepository productRepository = ProductRepository();
  List<ProductDTO> products = [];

  @override
  void initState() {
    super.initState();
    productRepository.getProductsRecommendation(widget.productShowing.category, widget.productShowing.id).then((fetchedProducts) {
      setState(() {
        products = fetchedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 50),
      child:Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.white24)),
            ),
            child:const Text(
              "Produits similaires",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Container(
            width: double.infinity,
            child:Wrap(
              children: [
                for (var product in products)
                  ProductCard(product: product),
              ],
            ),
          ),
        ],
      )
    );
  }
}
