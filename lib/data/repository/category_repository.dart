import 'package:demo_book_reader/models/category/category_model.dart';

abstract class CategoryRepository {
  // default get 5 books in book store
  Future<List<CategoryModel>> getCategories();

  Future<List<CategoryModel>> getCategoriesByName({required String name});
}
