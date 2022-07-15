import 'package:demo_book_reader/models/book/book_model.dart';

abstract class BookRepository {
  // default get 5 books in book store
  Future<List<BookModel>> getRecommendedBook({required int userId});
}
