import 'dart:io';
import 'package:markt/provider/product_draft.dart';
import 'package:markt/domain/product.dart';

class ProductDraftRepository {

  final productDraftProvider = ProductDraftProvider();


  Future<void> createProductDraft(Product productDraft, List<File> images) async {
    try {
      await productDraftProvider.insertProduct(productDraft, images);
      print('Product created successfully');
    } catch (e) {
      print('Failed to create product: $e');
    }
  }

  Future<List<Product>> getProductDraftsByUserID(int userId) async {
    try {
      return await productDraftProvider.getProductsByUserId(userId);
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }

}