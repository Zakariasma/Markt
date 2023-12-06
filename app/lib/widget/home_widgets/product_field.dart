import 'package:flutter/material.dart';


class ProductField extends StatelessWidget {

  final String _title;
  final double _fontSize;
  final FontWeight _fontWeight;


  ProductField(this._title, this._fontSize, this._fontWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      margin: const EdgeInsets.only(top: 3, left: 10, right: 10),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: const Color(0xFFE9E9E9),
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
