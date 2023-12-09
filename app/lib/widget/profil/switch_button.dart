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
        color: Colors.green,
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
              color: Colors.deepOrange,
            ),
            child: const Text(
              "test",
              style: TextStyle(
                color: Colors.white,
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
              color: Colors.deepPurple,
            ),
            child: const Text(
                "test",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
