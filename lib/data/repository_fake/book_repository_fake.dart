import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book_model.dart';

class BookRepositoryFake implements BookRepository {
  final List<BookModel> books = [
    BookModel(name: "Android",authorId: "0001",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Ios",authorId: "0002",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Linux",authorId: "0003",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Windows",authorId: "0004",rating: 5,bookUrl: "xxx.com"),
  ];

  @override
  Future<List<BookModel>> getBooks() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.unmodifiable(books);
  }

  @override
  Future<void> deleteBook(String name) async {
    books.removeWhere((element) => element.name == name);
  }

  @override
  Future<void> addBook(BookModel item) async {
    books.add(item);
  }
}


