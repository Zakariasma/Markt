import 'package:flutter/material.dart';

//Implements preferredSizeWidget for use in scaffold -> ERROR without
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        height: 75,
        child: Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Image.asset('assets/logo/square.png'),
        ),
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
