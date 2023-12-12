import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:markt/domain/product.dart';
import 'package:markt/env.dart';
import 'package:markt/domain/productDTO.dart';

class ProductProvider {
  Future<void> createProduct(Product product, List<File> images) async {
    print("provider");
    var uri = Uri.parse('${baseUrl}api/product');
    var request = http.MultipartRequest('POST', uri);

    // Ajoutez chaque image à la requête
    for (var image in images) {
      var file = await http.MultipartFile.fromPath(
        'pictureList',
        image.path,
      );
      request.files.add(file);
    }

    // Ajoutez chaque propriété de l'objet Product comme un champ séparé
    request.fields['title'] = product.title;
    request.fields['prix'] = product.prix;
    request.fields['categoryId'] = product.categoryId.toString();
    request.fields['description'] = product.description;
    request.fields['city'] = product.city;
    request.fields['postCode'] = product.postCode;
    request.fields['userId'] = product.userId.toString();

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Upload successful');
    } else {
      print('Upload failed');
    }
  }

  Future<List<ProductDTO>> getProducts() async {
    var response = await http.get(Uri.parse('${baseUrl}api/product'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ProductDTO> products = [];
      for (var item in data) {
        products.add(ProductDTO.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductDTO>> getProductsRecommendation(category, actualID) async {
    var response = await http.get(Uri.parse('${baseUrl}api/product/recommendation/$category/$actualID'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ProductDTO> products = [];
      for (var item in data) {
        products.add(ProductDTO.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductDTO>> getProductByCategoryID(int categoryId) async {
    var response = await http.get(Uri.parse('${baseUrl}api/product/category/$categoryId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ProductDTO> products = [];
      for (var item in data) {
        products.add(ProductDTO.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductDTO>> getProductByUserID(int userId) async {
    var response = await http.get(Uri.parse('${baseUrl}api/product/user/$userId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ProductDTO> products = [];
      for (var item in data) {
        products.add(ProductDTO.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

}
