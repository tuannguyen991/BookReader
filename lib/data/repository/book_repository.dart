import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getRecommendedBook({required String token});

  Future<List<BookModel>> getTopBook({required String token});

  Future<UserBookModel> getLastBook({required String token});

  Future<List<BookModel>> getSameCategoryBook({required String token, required UserBookModel bookItem});

  Future<bool> getIsFavorite({required String token, required UserBookModel bookItem});

  Future<List<UserBookModel>> getReadBook({required String token});

  Future<List<UserBookModel>> getFavoriteBook({required String token});

  Future<List<BookModel>> getUploadBooks({required String token});

  Future<List<String>> getHistorySearch({required String token});

  Future<List<BookModel>> getBooksByName({required String token, required String name});

  Future<void> addUploadBook({required String token, required BookModel bookItem});

  Future<void> deleteHistory({required String token, required String name});
}
