import 'package:flutter/material.dart';

import '../widget/login/hello.dart';
import '../widget/login/inscription_direction.dart';
import '../widget/login/login_form.dart';
import '../widget/universal_widgets/return_navbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("SE CONNECTER", ""),
      ),
      body: ListView(
        children: const <Widget>[
            Hello(),
            LoginForm(),
            InscriptionDirection(),
        ],
      ),
    );
  }

}
