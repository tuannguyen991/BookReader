import 'package:demo_book_reader/models/author/author_model.dart';

abstract class AuthorRepository {
  // default get 5 books in book store
  Future<List<AuthorModel>> getAuthors();

  Future<List<AuthorModel>> getAuthorsByName({required String name});
}
