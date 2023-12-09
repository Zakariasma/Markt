import 'package:flutter/material.dart';
import 'package:markt/widget/lobby/conversation_list.dart';

import '../widget/home_widgets/bottom_navbar.dart';
import '../widget/home_widgets/home_bar.dart';
import '../widget/universal_widgets/return_navbar.dart';

class LobbyChat extends StatefulWidget {
  const LobbyChat({super.key});

  @override
  State<LobbyChat> createState() => _LobbyChatState();
}

class _LobbyChatState extends State<LobbyChat> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          HomeBar(),
          ConversationList(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

}
