import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:markt/env.dart';

class PictureCard extends StatefulWidget {

  final String picture;
  final double margeRight;
  final double size;

  const PictureCard({super.key, required this.picture, required this.margeRight, required this.size});

  @override
  State<PictureCard> createState() => _PictureCardState();
}

class _PictureCardState extends State<PictureCard> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * widget.size;
    return Container(
      width: widthScreen,
      height: 100,
      margin: EdgeInsets.only(right: widget.margeRight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage('${baseUrl}assets/static/product_img/${widget.picture}'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
