import 'package:flutter/material.dart';
import 'package:markt/domain/category.dart';
import 'package:markt/data/category_repository.dart';


class CustomCategoryMenu extends StatefulWidget {
  final ValueNotifier<int> selectedCategory;

  const CustomCategoryMenu({required this.selectedCategory, Key? key}) : super(key: key);

  @override
  State<CustomCategoryMenu> createState() => _CustomCategoryMenuState();
}


class _CustomCategoryMenuState extends State<CustomCategoryMenu> {

  final CategoryRepository repository = CategoryRepository();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    repository.getAllCategories().then((fetchedCategories) {
      setState(() {
        categories = fetchedCategories;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: DropdownButtonFormField(
        dropdownColor: Colors.black,
        hint: const Text("Catégorie", style: TextStyle(color: Colors.white)), // Placeholder
        items: categories.map((Category category) {
          return DropdownMenuItem(
            value: category.id,
            child: Text(category.category_name),
          );
        }).toList(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 2.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        onChanged: (value){
          widget.selectedCategory.value = value!;
        },

      ),
    );
  }

}

