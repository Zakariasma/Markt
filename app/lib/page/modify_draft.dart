import 'package:flutter/material.dart';
import 'package:markt/widget/modify_draft/formulaire_edit.dart';
import 'package:markt/domain/productDTO.dart';

import '../widget/universal_widgets/return_navbar.dart';

class ModifyDraft extends StatefulWidget{

  final ProductDTO productDTO;

  const ModifyDraft({super.key, required this.productDTO});

  @override
  State<ModifyDraft> createState() => _ModifyDraftState();
}

class _ModifyDraftState extends State<ModifyDraft> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnNavbar("MODIFIER UN BROUILLON", "editdraft"),
      ),
      body: ListView(
        children: <Widget>[
          FormulaireEdit(productDTO: widget.productDTO)
        ],
      ),
    );
  }

}
