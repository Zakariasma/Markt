import 'package:flutter/material.dart';

class PictureCard extends StatefulWidget {
  const PictureCard({super.key});

  @override
  State<PictureCard> createState() => _PictureCardState();
}

class _PictureCardState extends State<PictureCard> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.9;
    return Container(
      width: widthScreen,
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.cyan,
      ),
    );
  }
}
