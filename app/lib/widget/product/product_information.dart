import 'package:flutter/material.dart';

import '../../domain/productDTO.dart';

class ProductInformation extends StatefulWidget {

  final ProductDTO productShowing;

  const ProductInformation({super.key, required this.productShowing});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {

  Container informationContainer(String title, int fontSize, FontWeight fontWeight) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize.toDouble(),
          fontWeight: fontWeight,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          informationContainer(widget.productShowing.title, 25, FontWeight.bold),
          informationContainer("${widget.productShowing.prix} €",25, FontWeight.bold),
          informationContainer(widget.productShowing.date, 15, FontWeight.w500),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            child: const Text(
              "Contacter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
