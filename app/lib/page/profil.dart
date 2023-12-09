import 'package:flutter/material.dart';

import '../widget/home_widgets/bottom_navbar.dart';
import '../widget/home_widgets/home_bar.dart';
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
      body: ListView(
        children: <Widget>[
          HomeBar(),
          ProfilCard(),
          ProfilProduct(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
