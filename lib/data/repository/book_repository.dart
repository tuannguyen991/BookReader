import '../../models/book/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBooks();
  Future<void> deleteBook(String id);
  Future<void> addBook(BookModel item);
  Future<List<BookModel>> getRecommendedBook({required int userId});
}
