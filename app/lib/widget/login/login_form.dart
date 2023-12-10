import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     height: 300,
     margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mot de passe',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2E2E2),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text('Se connecter'),
            ),
          ),
        ],
      ),

    );
  }
}
