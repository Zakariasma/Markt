import 'package:flutter/material.dart';

class ConversationCard extends StatefulWidget {
  const ConversationCard({super.key});

  @override
  State<ConversationCard> createState() => _ConversationCardState();
}

class _ConversationCardState extends State<ConversationCard> {

  Widget field(double heightField, double sizeField, FontWeight fontWeightField, String title) {
    return Container(
      width: double.infinity,
      height: heightField,
      color: const Color(0xFF666666),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: sizeField,
          fontWeight: fontWeightField,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF333333),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF444444),
            ),
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.only(left: 10),
            height: 75,
            color: const Color(0xFF555555),
            child:Column(
              children: [
                field(30, 19, FontWeight.bold, "MacBook Pro 13"),
                field(25, 15, FontWeight.w500, "Last message date"),
                field(20, 13, FontWeight.w500, "18 Avril 2023"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
