import 'package:demo_book_reader/models/author/author_model.dart';

abstract class AuthorRepository {
  // default get 5 books in book store
  Future<List<AuthorModel>> getAuthors({required String token});

  Future<List<AuthorModel>> getAuthorsByName(
      {required String token, required String name});
}
