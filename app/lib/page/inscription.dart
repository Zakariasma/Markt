import 'package:flutter/material.dart';

import '../widget/login/hello.dart';
import '../widget/login/inscription_form.dart';

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
      body: ListView(
        children: const <Widget>[
          Hello(),
          InscriptionForm(),
        ],
      ),
    );
  }

}
