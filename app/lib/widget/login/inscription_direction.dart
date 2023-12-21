import 'package:flutter/material.dart';

class InscriptionDirection extends StatelessWidget {
  const InscriptionDirection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/inscription');
        },
        child: Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
          color: Colors.black,
          child: const Center(
            child: Text(
              "S'INSCRIRE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }


}
