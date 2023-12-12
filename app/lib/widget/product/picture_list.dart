import 'package:flutter/material.dart';
import 'package:markt/widget/product/picture_card.dart';

import '../../domain/productDTO.dart';


class PictureList extends StatefulWidget {

  final ProductDTO productShowing;

  const PictureList({super.key, required this.productShowing});

  @override
  State<PictureList> createState() => _PictureListState();

}

class _PictureListState extends State<PictureList> {

  @override
  Widget build(BuildContext context) {
    var margeRight = 10;
    var size = 0.9;
    if(widget.productShowing.pictureList.length < 2){
      margeRight = 0;
      size = 1;
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(var i = 0; i < widget.productShowing.pictureList.length; i++)
            PictureCard(picture: widget.productShowing.pictureList[i], margeRight: margeRight.toDouble(), size: size)
        ],
      ),
    );

  }
}
