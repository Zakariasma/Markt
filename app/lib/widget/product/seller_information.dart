import 'package:flutter/material.dart';
import 'package:markt/env.dart';

import '../../domain/productDTO.dart';

class SellerInformation extends StatefulWidget {

  final ProductDTO productShowing;

  const SellerInformation({super.key, required this.productShowing});

  @override
  State<SellerInformation> createState() => _SellerInformationState();
}

class _SellerInformationState extends State<SellerInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 35),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white24)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 75,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Information sur le vendeur",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child:Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage('${baseUrl}assets/static/pdp/${widget.productShowing.profilPicture}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.productShowing.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
