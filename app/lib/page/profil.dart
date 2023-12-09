import 'package:flutter/material.dart';

import '../widget/profil/profil_card.dart';
import '../widget/profil/profil_product.dart';
import '../widget/universal_widgets/return_navbar.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("PROFIL"),
      ),
      body: ListView(
        children: <Widget>[
          ProfilCard(),
          ProfilProduct(),
        ],
      ),
    );
  }
}
