import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFE9E9E9),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,

          type: BottomNavigationBarType.fixed, //Must add this if icones>3
          elevation: 0, //Hide shadow
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF222222),
          unselectedItemColor: Colors.black38,

          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Add product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_card_outlined),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profil',
            ),
          ]

    ),
    );
  }

}