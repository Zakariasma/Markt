import 'package:flutter/material.dart';

import '../data/product_repository.dart';
import '../domain/productDTO.dart';
import '../widget/home_widgets/bottom_navbar.dart';
import '../widget/home_widgets/home_bar.dart';
import '../widget/profil/profil_card.dart';
import '../widget/profil/profil_product.dart';
import 'package:markt/token/token_manage.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final ProductRepository productRepository = ProductRepository();
  List<ProductDTO> products = [];

  @override
  void initState() {
    super.initState();
    setupInitialData();
  }

  Future<void> setupInitialData() async {
    Map<String, dynamic>? token = await TokenManager.extractTokenData();
    int? userId = token?['id'];
    if (userId != null) {
      productRepository.getProductsByUserID(userId).then((fetchedProducts) {
        setState(() {
          products = fetchedProducts;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          HomeBar(),
          ProfilCard(),
          ProfilProduct(products: products),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
