import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/product_field.dart';
import 'package:markt/domain/productDTO.dart';
import 'package:markt/env.dart';
import 'package:markt/page/product_page.dart';
import 'package:markt/widget/profil/draft_options.dart';

class DraftCard extends StatefulWidget{

  final ProductDTO product;

  DraftCard({super.key, required this.product});

  @override
  _ProductCard createState() => _ProductCard();

}

class _ProductCard extends State<DraftCard> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth * 0.45;
        double marginPerfect = constraints.maxWidth * 0.03333;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(product: widget.product),
              ),
            );
          },
          child: Container(
            width: width,
            height: width + 120,
            margin: EdgeInsets.only(left: marginPerfect, bottom: 50),
            child: Column(
              children:<Widget> [
                Container(
                  width: double.infinity,
                  height: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.product.pictureList[0])),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFFE9E9E9),
                  ),
                ),
                ProductField(widget.product.title, 20.0, FontWeight.bold ),
                ProductField("${widget.product.prix.toString()} €", 20, FontWeight.bold),
                ProductField("${widget.product.postCode} ${widget.product.city}", 15, FontWeight.w400),
                DraftOption(product: widget.product),
              ],
            ),
          ),
        );
      },
    );
  }
}
