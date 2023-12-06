import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: "Nom du produit",
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Veuillez entrer un nom de produit";
          }
          return null;
        },
      ),
    );
  }
}
