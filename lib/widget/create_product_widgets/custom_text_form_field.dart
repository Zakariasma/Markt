import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

  final String _label;
  final String _errorMessage;
  TextEditingController _controller = TextEditingController();

  CustomTextFormField(this._label, this._errorMessage, this._controller);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: widget._label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 2.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget._errorMessage;
          }
          return null;
        },
        controller: widget._controller,
      ),
    );
  }
}


