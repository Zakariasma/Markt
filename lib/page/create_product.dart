import 'package:flutter/material.dart';
import 'package:markt/widget/create_product_widgets/formulaire_product.dart';
import 'package:markt/widget/universal_widgets/return_navbar.dart';

class CreateProduct extends StatefulWidget{

  @override
  _CreateProduct createState() => _CreateProduct();
}

class _CreateProduct extends State<CreateProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("VENDRE UN PRODUIT"),
      ),
      body: ListView(
        children: <Widget>[
          FormulaireProduct(),
        ],
      ),
    );
  }

}