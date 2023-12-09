import 'package:flutter/material.dart';

class ReturnNavbar extends StatelessWidget{

  final String index;
  final String _title;

  ReturnNavbar(this._title, this.index);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF222222),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white12,
              width: 2.0,
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context, '/$index');
        },
      ),
      title: Text(
        _title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

    );
  }
}

