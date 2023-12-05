import 'package:flutter/material.dart';

//Implements preferredSizeWidget for use in scaffold -> ERROR without
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
      return AppBar(
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          color: Colors.redAccent,
          child: Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: const Text(
              'Market',
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
