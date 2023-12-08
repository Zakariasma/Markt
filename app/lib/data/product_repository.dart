import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:markt/provider/product_provider.dart';
import 'package:markt/domain/product.dart';

class ProductRepository {
  final productProvider = ProductProvider();

  Future<void> createProduct(Product product, List<File> images) async {
    print("data");
    try {
      await productProvider.createProduct(product, images);
      print('Product created successfully');
    } catch (e) {
      print('Failed to create product: $e');
    }
  }
}
