
import 'package:demo_book_reader/models/category/category_model.dart';

abstract class CategoryRepository {
  // default get 5 books in book store
  Future<List<CategoryModel>> getCategories({required String token});

  Future<List<CategoryModel>> getCategoriesByName({required String token, required String name});
}
