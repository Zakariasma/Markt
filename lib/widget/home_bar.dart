import 'package:flutter/material.dart';

//Implements preferredSizeWidget for use in scaffold -> ERROR without
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
