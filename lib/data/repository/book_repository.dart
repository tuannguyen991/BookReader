import 'package:demo_book_reader/models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBooks();
  Future<void> deleteBook(String id);
  Future<void> addBook(BookModel item);
}