import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time_filled_rounded),
          label: 'Encee',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline), // Ajoutez l'icône de votre choix
          label: 'Nouveau', // Ajoutez le libellé de votre choix
        ),
      ],
    );
  }

}