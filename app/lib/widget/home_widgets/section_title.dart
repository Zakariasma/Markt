import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String _title;

  SectionTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 25, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          _title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color : Color(0xFFE9E9E9),
          ),
        ),
      ),
    );
  }
}
