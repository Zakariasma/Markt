import 'package:markt/domain/category.dart';
import 'package:markt/provider/category_provider.dart';

class CategoryRepository {
  final categoryProvider = CategoryProvider();

  Future<List<Category>> getAllCategories() => categoryProvider.fetchCategories();
}
