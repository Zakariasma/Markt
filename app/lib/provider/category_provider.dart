import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/domain/category.dart';

class CategoryProvider {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('http://192.168.1.43:3000/api/category'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories from API');
    }
  }
}
