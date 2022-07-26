import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';

abstract class BookRepository {
  // default get 5 books in book store
  Future<List<BookModel>> getRecommendedBook({required String token});

  Future<List<BookModel>> getTopBook({required String token});

  Future<BookModel> getLastBook({required String token});

  Future<List<BookModel>> getSameCategoryBook({required String token, required BookModel bookItem});

  Future<bool> getIsFavorite({required String token, required BookModel bookItem});

  Future<List<BookModel>> getReadBook({required String token});

  Future<List<BookModel>> getFavoriteBook({required String token});

  Future<List<String>> getHistorySearch({required String token});

  Future<void> deleteHistory({required String token, required String name});
}
