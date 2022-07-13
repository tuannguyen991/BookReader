import 'package:demo_book_reader/models/author_model.dart';

abstract class AuthorRepository {
  Future<List<AuthorModel>> getAuthors();
  Future<void> deleteAuthor(String id);
  Future<void> addAuthor(AuthorModel item);
}
