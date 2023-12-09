import 'package:flutter/material.dart';
import 'package:markt/widget/product/picture_card.dart';

class PictureList extends StatefulWidget {
  const PictureList({super.key});

  @override
  State<PictureList> createState() => _PictureListState();
}

class _PictureListState extends State<PictureList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PictureCard(),
          PictureCard(),
          PictureCard(),
        ],
      ),
    );
  }
}
