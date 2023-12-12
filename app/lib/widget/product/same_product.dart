import 'package:flutter/material.dart';

import '../../domain/productDTO.dart';

class SameProduct extends StatefulWidget {

  final ProductDTO productShowing;

  const SameProduct({super.key, required this.productShowing});

  @override
  State<SameProduct> createState() => _SameProductState();
}

class _SameProductState extends State<SameProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 50),
      height: 450,
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
            height: 400,
            color: Colors.blue,
            child:Wrap(
              children: [

              ],
            ),
          ),
        ],
      )
    );
  }
}
