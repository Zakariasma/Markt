import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final GlobalKey<FormState> formKey;
  final TextEditingController _label;

  CustomButton(this.formKey, this._label);

  @override
  _CustomButtonState createState() => _CustomButtonState();
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
          if (widget.formKey.currentState!.validate()) {
            final test = widget._label.text;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Envoie msg')),
            );
            print('ajout de $test');
          }
        },
        child: Text("Valider"),
      ),
    );
  }
}

