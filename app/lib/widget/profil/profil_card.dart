import 'package:flutter/material.dart';

class ProfilCard extends StatefulWidget {
  const ProfilCard({super.key});

  @override
  State<ProfilCard> createState() => _ProfilCardState();
}

class _ProfilCardState extends State<ProfilCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.only(right: 10, left: 10, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE9E9E9),
      ),
      child:Row(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.only(left:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: const Text(
              "Charle",
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )
    );
  }
}
