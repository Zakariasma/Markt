import 'package:flutter/material.dart';
import 'package:markt/widget/create_product_widgets/draft_callback.dart';
import 'package:markt/widget/create_product_widgets/formulaire_product.dart';
import 'package:markt/widget/universal_widgets/return_navbar.dart';

import '../token/token_manage.dart';

class CreateProduct extends StatefulWidget{

  @override
  _CreateProduct createState() => _CreateProduct();
}

class _CreateProduct extends State<CreateProduct> {

  @override
  void initState(){
    super.initState();
    checkRoute();
  }

  void checkRoute() async{
    Map<String, dynamic>? token = await TokenManager.extractTokenData();
    int? userId = token?['id'];
    if(userId == null){
      Navigator.pushNamed(context, '/login');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("VENDRE UN PRODUIT", "product"),
      ),
      body: ListView(
        children: <Widget>[
          FormulaireProduct(),
        ],
      ),
    );
  }

}