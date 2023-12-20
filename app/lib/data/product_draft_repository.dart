import 'dart:io';
import 'package:markt/provider/product_draft.dart';
import 'package:markt/domain/product.dart';

import '../domain/productDTO.dart';

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

  Future<List<ProductDTO>> getProductDraftsByUserID(int userId) async {
    try {
      return await productDraftProvider.getProductsByUserId(userId);
    } catch (e) {
      print('Failed to load products: $e');
      return [];
    }
  }

  Future<void> deleteProductDraft(int productId) async {
    try {
      await productDraftProvider.deleteProduct(productId);
      print('Product deleted successfully');
    } catch (e) {
      print('Failed to delete product: $e');
    }
  }

}