import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/domain/productDTO.dart';
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


class FormulaireEdit extends StatefulWidget {

  final ProductDTO productDTO;

  const FormulaireEdit({super.key, required this.productDTO});

  @override
  State<FormulaireEdit> createState() => _FormulaireEditState();
}

class _FormulaireEditState extends State<FormulaireEdit> {

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
    _images.addAll(widget.productDTO.pictureList.map((path) => XFile(path)));
    _titleController.text = widget.productDTO.title;
    _priceController.text = widget.productDTO.prix.toString();
    _descriptionController.text = widget.productDTO.description;
    _localisation.add(widget.productDTO.city);
    _localisation.add(widget.productDTO.postCode);
  }
  saveDraft() {
    print("save");
  }

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void saveDraftBD() async {
    Map<String, dynamic>? token = await TokenManager.extractTokenData();
    int? userId = token?['id'];
    var product = Product(
      id: widget.productDTO.id,
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
    await productDraftRepository.updateProductDraft(product, imageFiles);
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

          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.only(top: 20, bottom: 30, right: 10, left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2E2E2),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  saveDraftBD();
                }
              },
              child: Text('Modifier le produit'),
            ),
          ),
        ],
      ),
    );
  }

}
