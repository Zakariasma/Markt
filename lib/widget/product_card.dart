import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget{

  @override
  _ProductCard createState() => _ProductCard();

}

class _ProductCard extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth * 0.45;
        double marginPerfect = constraints.maxWidth * 0.03333;
        return Container(
          width: width,
          height: width + 50,
          color: Colors.red,
          margin: EdgeInsets.only(left: marginPerfect, top: marginPerfect),
        );
      },
    );
  }

}
