import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {

  final VoidCallback onSubmit;
  final String buttonText;

  const SubmitButton({super.key, required this.onSubmit, required this.buttonText});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 20, bottom: 30, right: 10, left: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE2E2E2),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decorationColor: Colors.red,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.onSubmit,
        child: Text(widget.buttonText),
      ),
    );
  }

}
