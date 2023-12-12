import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/domain/category.dart';
import 'package:markt/env.dart';

class CategoryProvider {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}api/category'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories from API');
    }
  }

}
