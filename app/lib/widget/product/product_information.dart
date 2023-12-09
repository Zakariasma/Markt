import 'package:flutter/material.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {

  Container informationContainer(String title, int fontSize, FontWeight fontWeight) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize.toDouble(),
          fontWeight: fontWeight,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          informationContainer("Macbook Air 2022", 25, FontWeight.bold),
          informationContainer("855 €",25, FontWeight.bold),
          informationContainer("Aujourd'hui à 16:19", 15, FontWeight.w500),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            child: const Text(
              "Contacter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
