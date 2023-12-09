import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:markt/domain/product.dart';
import 'package:markt/env.dart';

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

}