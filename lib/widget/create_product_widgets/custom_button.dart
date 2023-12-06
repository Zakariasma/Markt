import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFE9E9E9),
      ),
      child: ElevatedButton(
        onPressed: (){
          if (widget._formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Envoie msg')),
            );
          }
        },
        child: Text("Valider"),
      ),
    );
  }
}
