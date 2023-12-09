import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child:Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child:const Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam nisl nunc eget nisl",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      )
    );
  }
}
