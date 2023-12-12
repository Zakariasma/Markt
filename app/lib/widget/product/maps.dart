import 'package:flutter/material.dart';

import '../../domain/productDTO.dart';

class Maps extends StatefulWidget {

  final ProductDTO productShowing;

  const Maps({super.key, required this.productShowing});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child:Column(
        children:[
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.cyan,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10),
            child: const Text(
              "Localisation",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      )
    );
  }
}
