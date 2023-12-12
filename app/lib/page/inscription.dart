import 'package:flutter/material.dart';

import '../widget/login/hello.dart';
import '../widget/login/inscription_form.dart';
import '../widget/universal_widgets/return_navbar.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("S'INSCRIRE", "login"),
      ),
      body: ListView(
        children: const <Widget>[
          Hello(),
          InscriptionForm(),
        ],
      ),
    );
  }

}
