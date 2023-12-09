import 'package:flutter/material.dart';
import 'package:markt/widget/lobby/conversation_card.dart';

class ConversationList extends StatefulWidget {
  const ConversationList({super.key});

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10, top: 20, right: 10, left: 10),
      child: const Column(
        children: [
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
          ConversationCard(),
        ],
      ),
    );
  }
}
