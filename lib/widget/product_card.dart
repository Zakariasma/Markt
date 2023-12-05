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
            height: width + 70,
            color: Colors.red,
            margin: EdgeInsets.only(left: marginPerfect, top: marginPerfect),
            child: Column(
              children:<Widget> [
                Container(
                  width: double.infinity,
                  height: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amberAccent
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.brown,
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    "test de",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.brown,
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    "50E",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
        );
      },
    );
  }


}
