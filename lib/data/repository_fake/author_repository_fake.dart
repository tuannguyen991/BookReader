import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';

class AuthorRepositoryFake implements AuthorRepository {
  final List<AuthorModel> authors = [
    const AuthorModel(id: '1', name: "Anh Tuấn", gender: 'Male'),
    const AuthorModel(id: '2', name: "Kang", gender: 'Male'),
  ];

  @override
  Future<List<AuthorModel>> getAuthors() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(authors);
  }

  @override
  Future<void> deleteAuthor(String id) async {
    authors.removeWhere((element) => element.id == id);
  }

  @override
  Future<void> addAuthor(AuthorModel item) async {
    authors.add(item);
  }
}
