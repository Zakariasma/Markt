import 'package:flutter/material.dart';


class CustomCategoryMenu extends StatefulWidget {
  const CustomCategoryMenu({super.key});

  @override
  State<CustomCategoryMenu> createState() => _CustomCategoryMenuState();
}

class _CustomCategoryMenuState extends State<CustomCategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: DropdownButtonFormField(
        dropdownColor: Colors.black,
        hint: Text("Catégorie"), // Placeholder
        items: const[
          DropdownMenuItem(
            child: Text("Technologie"),
            value: "Technologie",
          ),
          DropdownMenuItem(
            child: Text("Informatique"),
            value: "Informatique",
          ),
          DropdownMenuItem(
            child: Text("Automobile"),
            value: "Automobile",
          ),
        ],
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
        value: "Technologie",
        onChanged: (value){
          print(value);
        },
      ),
    );
  }
}

