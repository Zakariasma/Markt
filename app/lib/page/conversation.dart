import 'package:flutter/material.dart';

import '../widget/universal_widgets/return_navbar.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("MacBook Pro 13"),
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }

}
