import 'package:flutter/material.dart';

import '../widget/login/hello.dart';
import '../widget/login/inscription_direction.dart';
import '../widget/login/login_form.dart';

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
