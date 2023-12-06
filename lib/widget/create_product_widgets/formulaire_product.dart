import 'package:flutter/material.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';
import 'package:markt/widget/create_product_widgets/custom_text_form_field.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';

class FormulaireProduct extends StatefulWidget {
  const FormulaireProduct({super.key});

  @override
  State<FormulaireProduct> createState() => _FormulaireProduct();
}

class _FormulaireProduct extends State<FormulaireProduct> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
        children: <Widget>[
          CustomTextFormField(),
          const CustomButton(),
    ],
        ),
    );
  }
}
