import 'package:flutter/material.dart';
import 'package:markt/widget/profil/switch_button.dart';

import '../../domain/productDTO.dart';
import '../home_widgets/product_card.dart';

class ProfilProduct extends StatefulWidget {

  final List<ProductDTO> products;

  const ProfilProduct({super.key, required this.products});

  @override
  State<ProfilProduct> createState() => _ProfilProductState();
}

class _ProfilProductState extends State<ProfilProduct> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 10, left: 10, top: 20),
      child:Column(
        children:[
          SwitchButton(),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: double.infinity,
            child: Wrap(
              children: [
                for (ProductDTO product in widget.products)
                  ProductCard(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
