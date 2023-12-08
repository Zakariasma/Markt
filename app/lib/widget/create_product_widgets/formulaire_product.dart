import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/widget/create_product_widgets/custom_button.dart';
import 'package:markt/widget/create_product_widgets/custom_text_form_field.dart';
import 'package:markt/widget/create_product_widgets/custom_category_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markt/widget/create_product_widgets/custom_image_picker.dart';
import 'package:markt/widget/create_product_widgets/get_localisation.dart';

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
  final Map<String,String> _localisation = <String,String>{};
  final List<XFile> _images = [];
  final ValueNotifier<int> _selectedCategory = ValueNotifier<int>(0);

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void printFormData() {
    print('Titre: ${_titleController.text}');
    print('Prix: ${_priceController.text}');
    print('Description: ${_descriptionController.text}');
    print('Catégorie sélectionnée: ${_selectedCategory.value}');
    print('Images: ${_images.map((image) => image.path).join(', ')}');
    print('localisation: ${_localisation}');
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
                printFormData();
              }
            },
            child: Text('Submit'),
          ),
        ],
        ),
    );
  }
}
