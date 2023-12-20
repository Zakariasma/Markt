import 'package:flutter/material.dart';

class DraftOption extends StatefulWidget {
  const DraftOption({super.key});

  @override
  State<DraftOption> createState() => _DraftOptionState();
}

class _DraftOptionState extends State<DraftOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            color: Colors.red,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
