import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:markt/provider/product_provider.dart';
import 'package:markt/domain/product.dart';

import '../domain/productDTO.dart';

class ProductRepository {
  final productProvider = ProductProvider();

  Future<void> createProduct(Product product, List<File> images) async {
    try {
      await productProvider.createProduct(product, images);
      print('Product created successfully');
    } catch (e) {
      print('Failed to create product: $e');
    }
  }

  Future<List<ProductDTO>> getProducts() async {
    try {
      return await productProvider.getProducts();
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }

  Future<List<ProductDTO>> getProductByCategoryID(int categoryId) async {
    try {
      return await productProvider.getProductByCategoryID(categoryId);
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }

  Future<List<ProductDTO>> getProductsRecommendation(category,actualID) async {
    try {
      return await productProvider.getProductsRecommendation(category, actualID);
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }

  Future<List<ProductDTO>> getProductsByUserID(int userId) async {
    try {
      return await productProvider.getProductByUserID(userId);
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }
}
