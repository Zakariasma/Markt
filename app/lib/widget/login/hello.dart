import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.topLeft,
              child: const Text(
                "Bonjour",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 50,
              child: const Text(
                "Connecter vous à votre compte pour accéder à l'application",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        )
    );
  }

}
