import 'package:flutter/material.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';
import 'package:markt/widget/create_product_widgets/custom_text_form_field.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';
import 'package:markt/widget/create_product_widgets/custom_category_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markt/widget/create_product_widgets/custom_image_picker.dart';

class FormulaireProduct extends StatefulWidget {
  const FormulaireProduct({super.key});

  @override
  State<FormulaireProduct> createState() => _FormulaireProduct();
}

class _FormulaireProduct extends State<FormulaireProduct> {

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  List<XFile> images = [];

  Future<void> selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        images.add(image);
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
        children: <Widget>[
          CustomImagePicker(),
          CustomTextFormField("Titre", "Veuillez entrez le titre...", _titleController, 1),
          CustomTextFormField("Prix", "Veuillez entrez le titre...", _priceController, 1),
          CustomCategoryMenu(),
          CustomTextFormField("Description", "Veuillez entrez une description...", _descriptionController, 5),
          CustomButton(_formKey, _titleController),
    ],
        ),
    );
  }
}
