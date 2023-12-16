import 'package:flutter/material.dart';

class DraftCallback extends StatefulWidget {

  final void Function() passAtCreatePage;

  const DraftCallback({super.key, required this.passAtCreatePage});

  @override
  State<DraftCallback> createState() => _DraftCallbackState();
}

class _DraftCallbackState extends State<DraftCallback> {

  callback() {
    widget.passAtCreatePage();
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF222222),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white12,
              width: 2.0,
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          callback();
        },
      ),
      title: const Text(
        "VENDRE UN PRODUIT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

    );
  }
}

