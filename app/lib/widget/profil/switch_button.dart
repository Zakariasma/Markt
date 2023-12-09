import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 0, 0, 0.2)
      ),
      child:Row(
        children: [
          Container(
            width: 150,
            margin: EdgeInsets.only(left:5, right:5),
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "En ligne",
              style: TextStyle(
                color: Colors.white10,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 65,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left:5, right:5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Text(
                "Brouillon",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
