import 'package:flutter/material.dart';

import '../../domain/productDTO.dart';

class ProductDescription extends StatefulWidget {

  final ProductDTO productShowing;

  const ProductDescription({super.key, required this.productShowing});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white24)),
      ),
      child:Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child:const Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              widget.productShowing.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      )
    );
  }
}
