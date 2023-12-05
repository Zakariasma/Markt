import 'package:flutter/material.dart';
import 'package:markt/widget/home_widgets/product_field.dart';

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
            height: width + 85,
            margin: EdgeInsets.only(left: marginPerfect, bottom: 50),
            child: Column(
              children:<Widget> [
                Container(
                  width: double.infinity,
                  height: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFE9E9E9),
                  ),
                ),
                ProductField("MacBook M2", 20.0, FontWeight.bold ),
                ProductField("50E", 20, FontWeight.bold),
                ProductField("6060 Charleroi", 15, FontWeight.w400),
              ],
            )
        );
      },
    );
  }


}
