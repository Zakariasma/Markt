import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';
import 'package:markt/widget/create_product_widgets/custom_text_form_field.dart';
import 'package:markt/widget/create_product_widgets/custom_category_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markt/widget/create_product_widgets/custom_image_picker.dart';
import 'package:markt/widget/create_product_widgets/get_localisation.dart';
import 'package:markt/data/product_repository.dart';
import 'package:markt/domain/product.dart';
import 'package:markt/domain/localisation.dart';
import 'dart:io';
import 'package:markt/token/token_manage.dart';
import 'package:markt/data/product_draft_repository.dart';

import '../universal_widgets/submit_button.dart';

class FormulaireProduct extends StatefulWidget {


  const FormulaireProduct({Key? key});

  @override
  State<FormulaireProduct> createState() => _FormulaireProduct();
}

class _FormulaireProduct extends State<FormulaireProduct> {

  final _formKey = GlobalKey<FormState>();
  final productRepository = ProductRepository();
  final productDraftRepository = ProductDraftRepository();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> _localisation = [];
  final List<XFile> _images = [];
  final ValueNotifier<int> _selectedCategory = ValueNotifier<int>(0);

  VoidCallback? onYesButtonPressed;

  @override
  void initState() {
    super.initState();
    onYesButtonPressed = saveDraft();
  }

  saveDraft() {
    print("save");
  }

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void sendFormData() async {
    Map<String, dynamic>? token = await TokenManager.extractTokenData();
    int? userId = token?['id'];
    if (_formKey.currentState!.validate()) {
      var product = Product(
        id: 0,
        pictureList: _images.map((image) => image.path).toList(),
        title: _titleController.text,
        prix: _priceController.text,
        categoryId: _selectedCategory.value,
        description: _descriptionController.text,
        city: _localisation[0],
        postCode: _localisation[1],
        userId: userId!,
      );

      var imageFiles = _images.map((xfile) => File(xfile.path)).toList();
      await productRepository.createProduct(product, imageFiles);

    }
  }

  void saveDraftBD() async {
      Map<String, dynamic>? token = await TokenManager.extractTokenData();
      int? userId = token?['id'];
      var product = Product(
        id: 11, // Doit modifier sinon update
        pictureList: _images.map((image) => image.path).toList(),
        title: _titleController.text,
        prix: _priceController.text,
        categoryId: _selectedCategory.value,
        description: _descriptionController.text,
        city: _localisation[0],
        postCode: _localisation[1],
        userId: userId!,
      );
      var imageFiles = _images.map((xfile) => File(xfile.path)).toList();
      await productDraftRepository.createProductDraft(product, imageFiles);
  }

  void printdb() async {
    var product = await productDraftRepository.getProductDraftsByUserID(1);
    print(product.length);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
        children: <Widget>[
          CustomImagePicker(images: _images),
          CustomTextFormField("Titre", "Veuillez entrez le titre...", _titleController, 1),
          CustomTextFormField("Prix", "Veuillez entrez le titre...", _priceController, 1),
          GetLocalisation(localisation: _localisation),
          CustomCategoryMenu(selectedCategory: _selectedCategory),
          CustomTextFormField("Description", "Veuillez entrez une description...", _descriptionController, 5),
          SubmitButton(
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                sendFormData();
                Navigator.pop(context, '/');
              }
            }, buttonText: 'Publier',
          ),

          SubmitButton(
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                saveDraftBD();
                Navigator.pop(context, '/');
              }
            }, buttonText: 'Sauvegarder le brouillon',
          ),
        ],
        ),
    );
  }
}
