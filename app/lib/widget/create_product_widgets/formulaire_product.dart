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

class FormulaireProduct extends StatefulWidget {
  const FormulaireProduct({super.key});

  @override
  State<FormulaireProduct> createState() => _FormulaireProduct();
}

class _FormulaireProduct extends State<FormulaireProduct> {

  final _formKey = GlobalKey<FormState>();
  final productRepository = ProductRepository();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> _localisation = [];
  final List<XFile> _images = [];
  final ValueNotifier<int> _selectedCategory = ValueNotifier<int>(0);

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void sendFormData() async {
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
        userId: 1,
      );

      var imageFiles = _images.map((xfile) => File(xfile.path)).toList();
      await productRepository.createProduct(product, imageFiles);

    }
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
          CustomCategoryMenu(selectedCategory: _selectedCategory),
          CustomTextFormField("Description", "Veuillez entrez une description...", _descriptionController, 5),
          CustomButton(_formKey, _titleController),
          GetLocalisation(localisation: _localisation),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                sendFormData();
              }
            },
            child: Text('Submit'),
          ),
        ],
        ),
    );
  }
}
